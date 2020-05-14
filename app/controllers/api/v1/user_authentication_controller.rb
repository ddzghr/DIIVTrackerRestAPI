# app/controllers/user_authentication_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class UserAuthenticationController < ApplicationController
      skip_before_action :authorize_request, only: :authenticate
      skip_authorization_check

      # return auth token once user is authenticated
      def authenticate
        auth_token = AuthenticateUser.new(request.host,
                                          params[:client_uuid],
                                          user_authentication_params[:password],
                                          user_authentication_params[:new_password],
                                          user_authentication_params[:new_password_confirmation])
                                     .call
        json_response(auth_token: auth_token)
      end

      # Logout user
      def logout
        unless @current_user.nil?
          @current_user.logout
          @current_user = nil
          json_response('You are successfully logged out') && return

        end
        raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
      end

      private

      def user_authentication_params
        params.require(:user_authentication)
              .permit(:password,
                      :new_password,
                      :new_password_confirmation)
      end
    end
  end
end
