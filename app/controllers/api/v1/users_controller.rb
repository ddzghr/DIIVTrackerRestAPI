# app/controllers/api/v1/users_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class UsersController < ApplicationController
      prepend_before_action :set_user, only: %i[show confirm reset_my_credentials reset update destroy]
      skip_before_action :authorize_request, only: %i[confirm reset reset_my_credentials]
      load_and_authorize_resource except: %i[confirm create reset reset_my_credentials fetch_owner]
      authorize_resource only: %i[fetch_owner create]
      skip_authorization_check only: %i[confirm reset reset_my_credentials]
      # GET /users
      def index
        render json: @users
      end

      # GET /couriers
      def list_couriers
        @users = @users.joins(:user_roles).joins(:roles).where(roles: { courier_type: true })
        render json: @users, each_serializer: ShortUserSerializer
      end

      # GET /owners
      # Device only
      def fetch_owner
        render json: 'Apps/Devices endpoint only', status: :unprocessable_entity and return if @current_device.nil?
        render json: @current_user, serializer: UserSerializer
      end

      # GET /users/:uuid
      def show
        authorize! :show, @user
        render json: @user
      end

      # POST /users
      def create
        all_params = user_params
        @user = User.new(all_params.except(:address))
        @user.address = Address.new(all_params[:address].except(:gps_location)) if all_params[:address]
        @user.address.gps_location = GpsLocation.new(all_params[:address][:gps_location]) if all_params[:address] && all_params[:address][:gps_location]
        saved = persist_all?
        if saved
          UserMailer.with(user: @user).confirm_email.deliver_now
          incl = []
          incl << 'address' unless @user.address.nil?
          incl << 'address.gps_location' unless @user.address.nil? || @user.address.gps_location.nil?
          render json: @user, status: :created, include: incl
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # GET /users
      def confirm
        render json: 'Already confirmed', status: :unprocessable_entity and return if @user.email_confirmed?
        if params[:user_token] == @user.confirm_token
          @user.email_confirmed = true
          if @user.save(validate: false)
            json_response(json_message('message', 'Your account is now confirmed.'), :ok)
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        else
          json_response(json_message('message', Message.invalid_token), :unprocessable_entity)
        end
      end

      # GET /users
      def reset_my_credentials
        UserMailer.with(user: @user).send_reset_request.deliver_now
        render json: 'Your request email has been successfully sent', status: :ok
      end

      # GET /users
      def reset
        if params[:user_token] == @user.password_reset_token
          @user.regenerate_password_reset_token
          @user.force_password_change = true
          @user.password = SecureRandom.base58(24)
          if @user.save(validate: false)
            UserMailer.with(user: @user).send_credentials.deliver_now
            render json: 'Your new credentials email has been successfully sent', status: :ok
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        else
          json_response(json_message('message', Message.invalid_token), :unprocessable_entity)
        end
      end

      # PATCH/PUT /users/:uuid
      def update
        authorize! :update, @user
        @user.email_confirmed = false
        if @user.update(user_params)
          UserMailer.with(user: @user).confirm_email.deliver_now
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/:uuid
      def destroy
        authorize! :destroy, @user
        @user.destroy
        render json: @user, status: :ok
      end

      private

      def persist_all?
        saved = false
        @user.transaction do
          @user.save
          unless @user.address.nil?
            @user.address.save if !@user.address.persisted? || @user.address.changed?
            unless @user.address.gps_location.nil?
              if !@user.address.gps_location.persisted? || @user.address.gps_location.changed?
                @user.address.gps_location.save
              end
            end
          end
          saved = true
        end
        saved
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user ||= User.find_by_uuid!(params[:uuid])
        render json: "Request cannot be processed", status: :unprocessable_entity unless @user && @user.user_active?
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        load_params = if @current_user.admin?
                        params.require(:user).permit(:name,
                                                     :email,
                                                     :password,
                                                     :password_confirmation,
                                                     :company_name,
                                                     :user_active,
                                                     :user_locked,
                                                     :force_password_change)
                      else
                        params.require(:user).permit(:name,
                                                     :email,
                                                     :password,
                                                     :password_confirmation,
                                                     :company_name)
                      end
        load_params[:address] = params[:user][:address] if params[:user][:address]
        load_params.permit!
        load_params
      end
    end
  end
end
