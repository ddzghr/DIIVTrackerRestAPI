# app/controllers/api/v1/devices_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class DevicesController < ApplicationController
      prepend_before_action :set_context
      prepend_before_action :set_device, only: %i[show confirm reset update destroy]
      skip_before_action :authorize_request, only: %i[confirm reset]
      skip_authorization_check only: %i[confirm reset]
      load_and_authorize_resource except: %i[confirm reset]
      # authorize_resource only: %i[]

      # GET /devices
      def index
        if @context == :client_context
          @devices = @devices.where(user_id: @current_user.id)
        elsif @context == :user_context
          @devices = @devices.joins(:user).where(users: { uuid: params[:user_uuid] })
        end
        render json: @devices
      end

      # GET /devices/1
      def show
        authorize! :show, @device
        if @context == :client_context
          render json: nil and return unless @device.user_id == @current_user.id
        end
        render json: @device
      end

      # POST /devices
      def create
        @device = Device.new(device_params)
        render json: jason_message('message', 'User can not have this type of device'), status: :unprocessable_entity and return unless can_have_device?(@device.user_id, @device.device_type_id)
        secret_token = SecureRandom.base58(24)
        @device.secret_token = secret_token
        @device.secret_token_confirmation = secret_token
        @device.device_confirmed = false # Force confirmation
        if @device.save
          DeviceMailer.with(device: @device).confirm_device.deliver_now
          render json: jason_message('value', secret_token), status: :created
        else
          render json: @device.errors, status: :unprocessable_entity
        end
      end

      # GET /users
      def confirm
        render json: jason_message('message', 'Already confirmed'), status: :unprocessable_entity and return if @device.device_confirmed?
        if params[:device_token] == @device.confirm_token
          @device.device_confirmed = true
          if @device.save(validate: false)
            render json: jason_message('message', 'Confirmed'), status: :ok
          else
            render json: @device.errors, status: :unprocessable_entity
          end
        else
          render json: jason_message('message','Invalid token'), status: :unprocessable_entity
        end
      end

      # GET /users
      def reset
        secret_token = SecureRandom.base58(24)
        @device.secret_token = secret_token
        @device.secret_token_confirmation = secret_token
        @device.device_confirmed = false # Force confirmation
        if @device.save
          DeviceMailer.with(device: @device).confirm_device.deliver_now
          render json: jason_message('value', secret_token), status: :ok
        else
          render json: @device.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /devices/1
      def update
        @device.device_confirmed = false
        if @device.update(device_params)
          DeviceMailer.with(device: @device).confirm_device.deliver_now
          render json: @device
        else
          render json: @device.errors, status: :unprocessable_entity
        end
      end

      # DELETE /devices/1
      def destroy
        @device.destroy
      end

      private

      def can_have_device?(user_id, device_type_id)
        RoleDeviceType.joins(role: [:user_roles]).where(user_roles: {user_id: user_id}, device_type_id: device_type_id, applicable: true).any?
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_device
        @device ||= Device.find_by_uuid(params[:uuid])
        render json: jason_message('message','Request cannot be processed'), status: :unprocessable_entity unless @device && @device.device_active?
      end

      # Only allow a trusted parameter "white list" through.
      def device_params
        load_params = if @current_user.admin?
                        params.require(:device).permit(:uuid,
                                                       :secret_token,
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
                        params.require(:device).permit(:uuid,
                                                       :name,
                                                       :device_type_id)
                      end
        # what is context
        if params[:user_uuid]
          load_params[:user_id] = User.find_by_uuid(params[:user_uuid]).id
        elsif params[:client_uuid]
          load_params[:user_id] = User.find_by_uuid(params[:client_uuid]).id
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
    end
  end
end
