# app/controllers/api/v1/user_roles_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class UserRolesController < ApplicationController
      before_action :set_user_role, only: [:show, :update, :destroy]
      load_and_authorize_resource
      skip_authorization_check

      # GET /user_roles
      def index
        #@user_roles = UserRole.all
        #Filter context
        if params[:user_uuid]
          @user_roles = @user_roles.find_by_user_id(User.find_by_uuid(params[:user_uuid]))
        elsif params[:client_uuid]
          @user_roles = @user_roles.find_by_user_id(@current_user.id)
        end
        render json: @user_roles
      end

      # GET /user_roles/1
      def show
        authorize! :show, @user_role
        if params[:user_uuid]
          raise CanCan::AccessDenied unless @user_role.user_id == User.find_by_uuid(params[:user_uuid]).id
        elsif params[:client_uuid]
          raise CanCan::AccessDenied unless @user_role.user_id == @current_user.id
        end
        render json: @user_role
      end

      # POST /user_roles
      def create
        @user_role = UserRole.new(user_role_params)

        if @user_role.save
          render json: @user_role, status: :created #, location: @user_role
        else
          render json: @user_role.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /user_roles/1
      def update
        if @user_role.update(user_role_params)
          render json: @user_role
        else
          render json: @user_role.errors, status: :unprocessable_entity
        end
      end

      # DELETE /user_roles/1
      def destroy
        @user_role.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user_role
        @user_role = UserRole.find_by_uuid(params[:uuid])
      end

      # Only allow a trusted parameter "white list" through.
      def user_role_params
        params.require(:user_role).permit(:uuid, :user_id, :role_id, :invoice, :valid_from, :valid_through)
      end
    end
  end
end