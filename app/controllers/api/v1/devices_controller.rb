# app/controllers/api/v1/devices_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class DevicesController < ApplicationController
      prepend_before_action :set_device, only: %i[show confirm reset update destroy]
      prepend_before_action :set_context
      skip_before_action :authorize_request, only: %i[confirm reset]
      skip_authorization_check only: %i[confirm reset]
      load_and_authorize_resource except: %i[confirm reset]
      # authorize_resource only: %i[]

      # GET /devices
      def index
        case @context
        when :client_context
          @devices = @devices.joins(:user).where(users: { uuid: params[:client_uuid] })
        when :user_context
          @devices = @devices.joins(:user).where(users: { uuid: params[:user_uuid] })
        when :device_context
          @devices = @devices.where(uuid: params[:device_uuid]) unless @current_device.web_server? # use ability
        else
          @devices = Device.none
        end
        response.set_header('X-Total-Count', @devices.count) if @devices
        render json: @devices
      end

      # GET /devices/:uuid
      def show
        authorize! :show, @device
        render json: @device
      end

      # POST /devices
      def create
        @device = Device.new(device_params)
        render json: json_message('message', Message.unallowed_device), status: :unprocessable_entity and return unless can_have_device?(@device.user_id, @device.device_type_id)
        secret_token = SecureRandom.base58(24)
        @device.secret_token = secret_token
        @device.secret_token_confirmation = secret_token
        @device.device_confirmed = false # Force confirmation
        if @device.save
          DeviceMailer.with(device: @device).confirm_device.deliver_now
          render json: json_message('value', secret_token), status: :created, location: context_url_generator(@device.uuid)
        else
          render json: @device.errors, status: :unprocessable_entity
        end
      end

      # GET /devices/:uuid/confirm
      def confirm
        render json: json_message('message', Message.confirmed), status: :unprocessable_entity and return if @device.device_confirmed?
        if params[:device_token] == @device.confirm_token
          @device.device_confirmed = true
          if @device.save(validate: false)
            render json: json_message('message', Message.confirm), status: :ok
          else
            render json: @device.errors, status: :unprocessable_entity
          end
        else
          render json: json_message('message', Message.invalid_token), status: :unprocessable_entity
        end
      end

      # GET /devices/:uuid/confirm
      def reset
        secret_token = SecureRandom.base58(24)
        @device.secret_token = secret_token
        @device.secret_token_confirmation = secret_token
        @device.device_confirmed = false # Force confirmation
        if @device.save
          DeviceMailer.with(device: @device).confirm_device.deliver_now
          render json: json_message('value', secret_token), status: :ok
        else
          render json: @device.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /devices/:uuid
      def update
        authorize! :update, @device
        @device.device_confirmed = false
        if @device.update(device_params)
          DeviceMailer.with(device: @device).confirm_device.deliver_now
          render json: @device
        else
          render json: @device.errors, status: :unprocessable_entity
        end
      end

      # DELETE /devices/:uuid
      def destroy
        authorize! :destroy, @device
        @device.destroy
      end

      private

      def can_have_device?(user_id, device_type_id)
        RoleDeviceType.joins(role: [:user_roles]).where(user_roles: {user_id: user_id}, device_type_id: device_type_id, applicable: true).any?
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_device
        @device = Device.find_by_uuid!(params[:uuid])
        if @context == :client_context
          raise CanCan::AccessDenied unless @device.user_id == User.find_by_uuid!(params[:client_uuid]).id
        elsif @context == :user_context
          raise CanCan::AccessDenied unless @device.user_id == User.find_by_uuid!(params[:user_uuid]).id
        elsif @context == :device_context
          raise CanCan::AccessDenied unless @device.user_id == Device.find_by_uuid!(params[:device_uuid]).user_id
        else
          raise CanCan::AccessDenied
        end
        render json: json_message('message', Message.cannot_process), status: :unprocessable_entity unless @device && @device.device_active?
      end

      # Only allow a trusted parameter "white list" through.
      def device_params
        load_params = if @current_user.admin?
                        params.require(:device).permit(:secret_token,
                                                       :name,
                                                       :device_type_id,
                                                       :valid_from,
                                                       :valid_through,
                                                       :device_active,
                                                       :device_confirmed,
                                                       :confirm_token,
                                                       :device_locked,
                                                       :unlock_token)
                      else
                        params.require(:device).permit(:name,
                                                       :device_type_id)
                      end
        # what is context
        if params[:user_uuid]
          load_params[:user_id] = User.find_by_uuid!(params[:user_uuid]).id
        elsif params[:client_uuid]
          load_params[:user_id] = User.find_by_uuid!(params[:client_uuid]).id
        elsif params[:device_uuid]
          load_params[:user_id] = @current_user.id
        end
        load_params.permit!
        load_params
      end

      def set_context
        # what is context
        @context = if params[:user_uuid]
                     :user_context
                   elsif params[:client_uuid]
                     :client_context
                   elsif params[:device_uuid]
                     :device_context
                   else
                     :unknown_context
                   end
      end

      def context_url_generator(uuid)
        case @context
        when :user_context
          clients_client_user_device_url(uuid: uuid)
        when :client_context
          clients_client_device_url(uuid: uuid)
        else
          uuid
        end
      end

    end
  end
end
