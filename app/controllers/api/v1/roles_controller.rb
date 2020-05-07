# app/controllers/api/v1/roles_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class RolesController < ApplicationController
      before_action :set_role, only: %i[show update destroy]

      # GET /roles
      def index
        @roles = Role.all

        render json: @roles
      end

      # GET /roles/1
      def show
        render json: @role
      end

      # POST /roles
      def create
        @role = Role.new(role_params)

        if @role.save
          render json: @role, status: :created #, location: @role
        else
          render json: @role.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /roles/1
      def update
        if @role.update(role_params)
          render json: @role
        else
          render json: @role.errors, status: :unprocessable_entity
        end
      end

      # DELETE /roles/1
      def destroy
        @role.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_role
        @role = Role.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def role_params
        params.require(:role).permit(:code,
                                     :name,
                                     :internal_admin_type,
                                     :internal_application_type,
                                     :ordering_party_type,
                                     :courier_type,
                                     :supplier_type,
                                     :has_duration,
                                     :has_invoice)
      end
    end
  end
end
