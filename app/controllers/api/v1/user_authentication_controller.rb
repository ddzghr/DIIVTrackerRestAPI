# app/controllers/user_authentication_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class UserAuthenticationController < ApplicationController
      skip_before_action :authorize_request, only: :authenticate
      # return auth token once user is authenticated
      def authenticate
        auth_token = AuthenticateUser.new(request.host,
                                          auth_params[:client_uuid],
                                          auth_params[:password],
                                          auth_params[:new_password],
                                          auth_params[:new_password_confirmation])
                                     .call
        json_response(auth_token: auth_token)
      end

      private

      def auth_params
        params.permit(:client_uuid,
                      :password,
                      :new_password,
                      :new_password_confirmation)
      end
    end
  end
end
