# app/controllers/api/v1/delivery-statuses_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class DeliveryStatusesController < ApplicationController
      before_action :set_delivery_status, only: [:show, :update, :destroy]
      skip_authorization_check

      # GET /delivery_statuses
      def index
        @delivery_statuses = DeliveryStatus.all

        render json: @delivery_statuses
      end

      # GET /delivery_statuses/1
      def show
        render json: @delivery_status
      end

      # POST /delivery_statuses
      def create
        @delivery_status = DeliveryStatus.new(delivery_status_params)

        if @delivery_status.save
          render json: @delivery_status, status: :created #, location: @delivery_status
        else
          render json: @delivery_status.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /delivery_statuses/1
      def update
        if @delivery_status.update(delivery_status_params)
          render json: @delivery_status
        else
          render json: @delivery_status.errors, status: :unprocessable_entity
        end
      end

      # DELETE /delivery_statuses/1
      def destroy
        @delivery_status.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_delivery_status
        @delivery_status = DeliveryStatus.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def delivery_status_params
        params.require(:delivery_status).permit(:delivery_id, :status_id, :device_id, :local_datetime, :assigned_device_id)
      end
    end
  end
end
