# app/controllers/api/v1/role_device_types_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class RoleDeviceTypesController < ApplicationController
      before_action :set_role_device_type, only: [:show, :update, :destroy]
      load_and_authorize_resource

      # GET /role_device_types
      def index
        # hide internal
        @role_device_types = @role_device_types
                             .joins(:role, :device_type)
                             .where(roles: { internal_admin_type: false,
                                             internal_application_type: false },
                                    device_types: {internal_api_server_type: false,
                                                   internal_web_server_type: false })
        render json: @role_device_types
      end

      # GET /role_device_types/1
      def show
        render json: @role_device_type
      end

      # POST /role_device_types
      def create
        @role_device_type = RoleDeviceType.new(role_device_type_params)

        if @role_device_type.save
          render json: @role_device_type, status: :created #, location: @role_device_type
        else
          render json: @role_device_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /role_device_types/1
      def update
        if @role_device_type.update(role_device_type_params)
          render json: @role_device_type
        else
          render json: @role_device_type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /role_device_types/1
      def destroy
        @role_device_type.destroy
        render json: @role_device_type, status: :ok
      end

      private

      def check_internal
        unless (@role_device_type.device_type.internal_api_server_type == false && @role_device_type.device_type.internal_web_server_type == false) &&
               (@role_device_type.role.internal_admin_type == false && @role_device_type.role.internal_application_type == false)
          # Always hide internals
          id = @role_device_type.id
          @role_device_type = nil
          raise ActiveRecord::RecordNotFound, "Couldn't find RoleDeviceType with 'id'=#{id}"
        end
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_role_device_type
        @role_device_type = RoleDeviceType.find(params[:id])
        check_internal
      end

      # Only allow a trusted parameter "white list" through.
      def role_device_type_params
        params.require(:role_device_type).permit(:role_id,
                                                 :device_type_id,
                                                 :applicable)
      end
    end
  end
end
