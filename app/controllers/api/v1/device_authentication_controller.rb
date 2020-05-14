# app/controllers/user_authentication_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class DeviceAuthenticationController < ApplicationController
      skip_before_action :authorize_request, only: :authenticate
      skip_authorization_check

      # return auth token once user is authenticated
      def authenticate
        auth_token = AuthenticateDevice.new(request.host,
                                            params[:device_uuid],
                                            device_authentication_params[:secure_token])
                                       .call
        json_response(auth_token: auth_token)
      end

      # Logout device
      def logout
        unless @current_device.nil?
          @current_device.logout
          @current_device = nil
          json_response('You are successfully logged out') && return

        end
        raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)

      end

      private

      def device_authentication_params
        params.require(:device_authentication)
              .permit(:device_uuid,
                      :secure_token)
      end
    end
  end
end
