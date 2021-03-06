# app/controllers/api/v1/roles_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class RolesController < ApplicationController
      prepend_before_action :set_role, only: %i[show update destroy]
      load_and_authorize_resource

      # GET /roles
      def index
        @roles = @roles.where(internal_admin_type: false, internal_application_type: false) # Always hide admin roles
        render json: @roles
      end

      # GET /roles/1
      def show
        # authorize! :show, @role
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
        # authorize! :update, @role
        if @role.update(role_params)
          render json: @role
        else
          render json: @role.errors, status: :unprocessable_entity
        end
      end

      # DELETE /roles/1
      def destroy
        # authorize! :destroy, @role
        @role.destroy
        render json: @role, status: :ok
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_role
        @role = Role.find(params[:id])
        check_admin_role
      end

      def check_admin_role
        unless @role.internal_admin_type == false && @role.internal_application_type == false
          # Always hide admin roles
          id = @role.id
          @role = nil
          raise ActiveRecord::RecordNotFound, "Couldn't find Role with 'id'=#{id}"
        end
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
