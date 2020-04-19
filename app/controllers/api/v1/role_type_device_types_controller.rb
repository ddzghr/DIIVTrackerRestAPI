# app/controllers/api/v1/role_type_device_types_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class RoleTypeDeviceTypesController < ApplicationController
      before_action :set_role_type_device_type, only: [:show, :update, :destroy]

      # GET /role_type_device_types
      def index
        @role_type_device_types = RoleTypeDeviceType.all

        render json: @role_type_device_types
      end

      # GET /role_type_device_types/1
      def show
        render json: @role_type_device_type
      end

      # POST /role_type_device_types
      def create
        @role_type_device_type = RoleTypeDeviceType.new(role_type_device_type_params)

        if @role_type_device_type.save
          render json: @role_type_device_type, status: :created, location: @role_type_device_type
        else
          render json: @role_type_device_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /role_type_device_types/1
      def update
        if @role_type_device_type.update(role_type_device_type_params)
          render json: @role_type_device_type
        else
          render json: @role_type_device_type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /role_type_device_types/1
      def destroy
        @role_type_device_type.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_role_type_device_type
        @role_type_device_type = RoleTypeDeviceType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def role_type_device_type_params
        params.require(:role_type_device_type).permit(:role_type_id, :device_type_id, :applicable)
      end
    end
  end
end
