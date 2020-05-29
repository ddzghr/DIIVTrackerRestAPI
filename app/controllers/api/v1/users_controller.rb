# app/controllers/api/v1/users_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class UsersController < ApplicationController
      prepend_before_action :set_user, only: %i[show confirm reset_my_credentials reset update destroy]
      skip_before_action :authorize_request, only: %i[create confirm reset reset_my_credentials]
      load_and_authorize_resource except: %i[create confirm reset reset_my_credentials fetch_owner]
      authorize_resource only: %i[fetch_owner]
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

      # GET /users/1
      def show
        authorize! :show, @user
        render json: @user
      end

      # POST /users
      def create
        @user = User.new(user_params)

        if @user.save
          UserMailer.with(user: @user).confirm_email.deliver_now
          render json: @user, status: :created #, location: @user
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
            render json: @user
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        else
          render json: 'Invalid token', status: :unprocessable_entity
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
          render json: 'Invalid token', status: :unprocessable_entity
        end
      end

      # PATCH/PUT /users/1
      def update
        @user.email_confirmed = false
        if @user.update(user_params)
          UserMailer.with(user: @user).confirm_email.deliver_now
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/1
      def destroy
        @user.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user ||= User.find_by_uuid(params[:uuid])
        render json: "Request cannot be processed", status: :unprocessable_entity unless @user && @user.user_active?
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        if @current_user.admin?
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
      end
    end
  end
end
