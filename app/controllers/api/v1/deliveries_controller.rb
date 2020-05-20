# app/controllers/api/v1/deliveries_controller.rb
# frozen_string_literal: true
module Api
  module V1
    # Handles deliveries
    class DeliveriesController < ApplicationController
      before_action :set_delivery, only: [:show, :update, :destroy]

      # GET /deliveries
      def index
        @deliveries = Delivery.all

        render json: @deliveries
      end

      # GET /deliveries/1
      def show
        render json: @delivery
      end

      # POST /deliveries
      def create
        @delivery = Delivery.new(delivery_params)

        if @delivery.save
          render json: @delivery, status: :created #, location: @delivery
        else
          render json: @delivery.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /deliveries/1
      def update
        if @delivery.update(delivery_params)
          render json: @delivery
        else
          render json: @delivery.errors, status: :unprocessable_entity
        end
      end

      # DELETE /deliveries/1
      def destroy
        @delivery.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_delivery
        @delivery = Delivery.find_by_uuid(params[:uuid])
      end

      # Only allow a trusted parameter "white list" through.
      def delivery_params
        params.require(:delivery).permit(:uuid,
                                         :orderer_name,
                                         :orderer_email,
                                         :amount_on_delivery,
                                         :orderer_id,
                                         :supplier_id,
                                         :courier_id,
                                         :annotation)
      end
    end
  end
end
