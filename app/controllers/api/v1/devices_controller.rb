# app/controllers/api/v1/devices_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class DevicesController < ApplicationController
      skip_before_action :authorize_request, only: %i[create confirm reset reset_my_credentials]
      before_action :set_device, only: %i[show confirm reset update destroy]

      # GET /devices
      def index
        @devices = Device.all

        render json: @devices
      end

      # GET /devices/1
      def show
        render json: @device
      end

      # POST /devices
      def create
        @device = Device.new(device_params)

        if @device.save
          render json: @device, status: :created #, location: @device
        else
          render json: @device.errors, status: :unprocessable_entity
        end
      end

      # GET /users
      def confirm
        render json: 'Already confirmed', status: :unprocessable_entity and return if @device.device_confirmed?
        if params[:device_token] == @device.confirm_token
          @device.device_confirmed = true
          if @device.save(validate: false)
            render json: @device
          else
            render json: @device.errors, status: :unprocessable_entity
          end
        else
          render json: 'Invalid token', status: :unprocessable_entity
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
          render json: secret_token, status: :ok
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

      # Use callbacks to share common setup or constraints between actions.
      def set_device
        @device = Device.find(params[:uuid])
      end

      # Only allow a trusted parameter "white list" through.
      def device_params
        params.require(:device).permit(:uuid,
                                       :secret_token,
                                       :name,
                                       :user_id,
                                       :device_type_id,
                                       :valid_from,
                                       :valid_through,
                                       :device_active,
                                       :device_confirmed,
                                       :confirm_token,
                                       :device_locked,
                                       :unlock_token,
                                       :client_uuid)
      end
    end
  end
end
