# app/controllers/api/v1/device_types_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class DeviceTypesController < ApplicationController
      before_action :set_device_type, only: [:show, :update, :destroy]
      load_and_authorize_resource

      # GET /device_types
      def index
        @device_types = @device_types.where(internal_api_server_type: false, internal_web_server_type: false) # Always hide internal devices
        render json: @device_types
      end

      # GET /device_types/1
      def show
        # authorize! :show, @device_type
        render json: @device_type
      end

      # POST /device_types
      def create
        @device_type = DeviceType.new(device_type_params)
        if @device_type.save
          render json: @device_type, status: :created #, location: clients_client_device_types_url(@device_type)
        else
          render json: @device_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /device_types/1
      def update
        # authorize! :update, @device_type
        if @device_type.update(device_type_params)
          render json: @device_type
        else
          render json: @device_type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /device_types/1
      def destroy
        # authorize! :destroy, @device_type
        @device_type.destroy
        render json: @device_type, status: :ok
      end

      private

      def check_internal_device
        unless @device_type.internal_api_server_type == false && @device_type.internal_web_server_type == false
          # Always hide admin roles
          id = @device_type.id
          @device_type = nil
          raise ActiveRecord::RecordNotFound, "Couldn't find DeviceType with 'id'=#{id}"
        end
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_device_type
        @device_type = DeviceType.find(params[:id])
        check_internal_device
      end

      # Only allow a trusted parameter "white list" through.
      def device_type_params
        params.require(:device_type).permit(:code,
                                            :name,
                                            :internal_api_server_type,
                                            :internal_web_server_type,
                                            :desktop_type,
                                            :web_server_type,
                                            :mobile_type)
      end
    end
  end
end

