# app/controllers/api/v1/user_roles_controller.rb
# frozen_string_literal: true

module Api
  module V1
    class UserRolesController < ApplicationController
      prepend_before_action :set_user_role, only: [:show, :update, :destroy]
      load_and_authorize_resource

      # GET /user_roles
      def index
        # Filter context
        if params[:user_uuid]
          # Other user's roles
          @user_roles = @user_roles.where(user_id: User.find_by_uuid!(params[:user_uuid]).id)
          raise CanCan::AccessDenied if @user_roles.count.zero?

        elsif params[:client_uuid]
          # My user's roles
          @user_roles = @user_roles.where(user_id: @current_user.id)
        end
        render json: @user_roles
      end

      # GET /user_roles/:uuid
      def show
        authorize! :show, @user_role
        if params[:user_uuid]
          raise CanCan::AccessDenied unless @user_role.user_id == User.find_by_uuid!(params[:user_uuid]).id
        elsif params[:client_uuid]
          raise CanCan::AccessDenied unless @user_role.user_id == @current_user.id
        end
        render json: @user_role
      end

      # POST /user_roles
      def create
        @user_role = UserRole.new(user_role_params)
        unless check_role_is_valid?
          json_response(json_message('message', Message.cannot_process), :unprocessable_entity)
          return
        end
        if @user_role.save
          render json: @user_role, status: :created # , location: @user_role
        else
          render json: @user_role.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /user_roles/:uuid
      def update
        authorize! :update, @user_role
        json_response(json_message('message', Message.cannot_process), :unprocessable_entity) and return unless check_role_is_valid?
        if @user_role.update(user_role_params)
          render json: @user_role
        else
          render json: @user_role.errors, status: :unprocessable_entity
        end
      end

      # DELETE /user_roles/:uuid
      def destroy
        authorize! :destroy, @user_role
        if @user_role&.role&.internal_admin_type?
          json_response(json_message('message', Message.cannot_process), :unprocessable_entity)
          return
        end
        @user_role.destroy
        render json: @user_role, status: :ok
      end

      private

      def check_role_is_valid?
        ro = @user_role.role
        if ro.internal_admin_type?
          # highlander
          return false if UserRole.where(role_id: ro.id).any?
        end
        if ro.internal_application_type?
          # only admin can
          return false unless @current_user.admin?
        end
        if ro.has_invoice?
          return false if @user_role.invoice.nil?

          if params[:action] == 'create'
            @user_role.valid_from ||= DateTime.now
            @user_role.valid_through ||= 2.years.from_now
          end
        end
        if ro.has_duration? 
          if @user_role.valid_from.nil? ||
             @user_role.valid_through.nil? ||
             @user_role.valid_from > @user_role.valid_through
            return false
          end
        end
        true
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_user_role
        @user_role = UserRole.find_by_uuid!(params[:uuid])
        if params[:user_uuid]
          raise CanCan::AccessDenied unless @user_role.user_id == User.find_by_uuid!(params[:user_uuid]).id

        elsif params[:client_uuid]
          raise CanCan::AccessDenied unless @user_role.user_id == User.find_by_uuid!(params[:client_uuid]).id

        end
      end

      # Only allow a trusted parameter "white list" through.
      def user_role_params
        load_params = if @current_user.admin?
                        params.require(:user_role).permit(:role_id,
                                                          :invoice,
                                                          :valid_from,
                                                          :valid_through)
                      else
                        params.require(:user_role).permit(:role_id,
                                                          :invoice)
                      end
        if params[:action] == 'create'
          if params[:user_uuid]
            load_params[:user_id] = User.find_by_uuid!(params[:user_uuid]).id
          elsif params[:client_uuid]
            load_params[:user_id] = User.find_by_uuid!(params[:client_uuid]).id
          end
        else
          load_params.extract!(:role_id)
        end
        load_params.permit!
        load_params
      end
    end
  end
end
