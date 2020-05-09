# app/controllers/user_authentication_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class DeviceAuthenticationController < ApplicationController
      skip_before_action :authorize_request, only: :authenticate
      # return auth token once user is authenticated
      def authenticate
        auth_token = AuthenticateDevice.new(request.host,
                                            params[:device_uuid],
                                            auth_params[:secure_token])
                                       .call
        json_response(auth_token: auth_token)
      end

      private

      def auth_params
        params.require(:user_authentication)
              .permit(:device_uuid,
                      :secure_token)
      end
    end
  end
end
