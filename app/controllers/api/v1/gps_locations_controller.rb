# app/controllers/api/v1/gps_locations_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class GpsLocationsController < ApplicationController
      before_action :set_gps_location, only: [:show, :update, :destroy]
      skip_authorization_check

      # GET /gps_locations
      def index
        @gps_locations = GpsLocation.all

        render json: @gps_locations
      end

      # GET /gps_locations/1
      def show
        render json: @gps_location
      end

      # POST /gps_locations
      def create
        @gps_location = GpsLocation.new(gps_location_params)

        if @gps_location.save
          render json: @gps_location, status: :created #, location: @gps_location
        else
          render json: @gps_location.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /gps_locations/1
      def update
        if @gps_location.update(gps_location_params)
          render json: @gps_location
        else
          render json: @gps_location.errors, status: :unprocessable_entity
        end
      end

      # DELETE /gps_locations/1
      def destroy
        @gps_location.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_gps_location
        @gps_location = GpsLocation.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def gps_location_params
        params.require(:gps_location).permit(:gps_latitude, :gps_longitude, :locatable_type, :locatable_id)
      end
    end
  end
end
