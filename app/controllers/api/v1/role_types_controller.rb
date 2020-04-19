# frozen_string_literal: true

#  app/controllers/api/v1/role_types_controller.rb
module Api
  module V1
    class RoleTypesController < ApplicationController
      before_action :set_role_type, only: %i[show update destroy]

      # GET /role_types
      def index
        @role_types = RoleType.all

        render json: @role_types
      end

      # GET /role_types/1
      def show
        render json: @role_type
      end

      # POST /role_types
      def create
        @role_type = RoleType.new(role_type_params)

        if @role_type.save
          render json: @role_type, status: :created, location: @role_type
        else
          render json: @role_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /role_types/1
      def update
        if @role_type.update(role_type_params)
          render json: @role_type
        else
          render json: @role_type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /role_types/1
      def destroy
        @role_type.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_role_type
        @role_type = RoleType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def role_type_params
        params.fetch(:role_type, {}).permit(:code, :name,
                                            :internal_admin_type,
                                            :internal_application_type,
                                            :ordering_party_type,
                                            :courier_type, :supplier_type,
                                            :has_duration, :has_invoice)
      end
    end
  end
end
