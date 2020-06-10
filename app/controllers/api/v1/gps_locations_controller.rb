# app/controllers/api/v1/gps_locations_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class GpsLocationsController < ApplicationController
      prepend_before_action :set_gps_location, only: [:show, :update, :destroy]
      prepend_before_action :prepare_action_context
      load_and_authorize_resource except: :create
      authorize_resource only: :create

      # GET /gps_locations
      def index
        @gps_locations = case @action_context
                         when :delivery_status_context
                           @gps_locations.where(locatable: DeliveryStatus.find(params[:delivery_status_id]))
                         when :device_context
                           @gps_locations.where(locatable: Device.find_by_uuid!(params[:device_uuid]))
                         else
                           GpsLocation.none
                         end
        response.set_header('X-Total-Count', @gps_locations.count) if @gps_locations
        render json: @gps_locations
      end

      # GET /gps_locations/1
      def show
        render json: @gps_location
      end

      # POST /gps_locations
      def create
        @gps_location = GpsLocation.new(gps_location_params)
        upd_dev_statuses = false
        # context dependent
        if @action_context == :delivery_status_context
          ds = DeliveryStatus.find(params[:delivery_status_id])
          @gps_location.locatable = ds
        elsif @action_context == :device_context
          dev = Device.find_by_uuid!(params[:device_uuid])
          @gps_location.locatable = dev
          if dev.device_type.mobile_type
            upd_dev_statuses = true
          end
        else
          render json: Message.invalid_context, status: :unprocessable_entity and return
        end

        saved = persist_all?(upd_dev_statuses)

        if saved
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
        render json: @gps_location
      end

      private

      def prepare_action_context
        # what is context
        @action_context = if params[:delivery_status_id]
                            :delivery_status_context
                          elsif params[:device_uuid]
                            :device_context
                          else
                            :unknown_context
                          end
      end

      def persist_all?(upd_dev_statuses)
        saved = false
        @gps_location.transaction do
          @gps_location.save
          if upd_dev_statuses && @gps_location.locatable_type == 'Device'
            de = Delivery.group(:id)
                         .joins(delivery_statuses: :status)
                         .where(courier_id: @current_user.id, # just coureier user can set delivery gps
                                delivery_statuses: {device_id: @gps_location.locatable_id }, # and courier device
                                statuses: { in_progress_type_status: true }) # And with in progress status
                         .maximum('delivery_statuses.id') # last one
            unless de.empty?
              dl = Delivery.group(:id)
                           .joins(:delivery_statuses)
                           .where(id: de.keys, courier_id: @current_user.id) # just coureier user can set delivery gps
                           .maximum("delivery_statuses.id") # last one
              pr = de.select { |k, v| (dl.include?(k) && dl[k] == v) } # intersection
              DeliveryStatus.find(pr.values).each do |ds|
                ds.gps_locations.new(@gps_location.attributes.slice("gps_latitude", "gps_longitude"))
                ds.save
              end
            end
          end
          saved = true
        end
        saved
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_gps_location
        @gps_location = GpsLocation.find(params[:id])
        if @action_context == :delivery_status_context
          ds = DeliveryStatus.find(params[:delivery_status_id])
          raise CanCan::AccessDenied unless @gps_location.locatable == ds
          # TODO: dovrši pripadnost ds-a klijentu?
        elsif @action_context == :device_context
          de = Device.find_by_uuid!(params[:device_uuid])
          raise CanCan::AccessDenied unless @gps_location.locatable == de
          # TODO: dovrši pripadnost de-a klijentu?
        else
          raise CanCan::AccessDenied
        end
      end

      # Only allow a trusted parameter "white list" through.
      def gps_location_params
        params.require(:gps_location).permit(:gps_latitude, :gps_longitude)
      end
    end
  end
end
