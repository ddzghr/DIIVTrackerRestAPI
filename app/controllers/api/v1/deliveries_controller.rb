# app/controllers/api/v1/deliveries_controller.rb
# frozen_string_literal: true
module Api
  module V1
    # Handles deliveries
    class DeliveriesController < ApplicationController
      prepend_before_action :set_context
      prepend_before_action :set_delivery, only: [:show, :update, :destroy]
      skip_authorization_check

      # GET /deliveries
      def index
        @deliveries = Delivery.all
        # TODO: Dovrši kontekst po svim akcijama
        # if @context == :client_context
        #   @deliveries = @deliveries.where(user_id: @current_user.id)
        # elsif @context == :user_context
        #   @deliveries = @deliveries.joins(:user).where(users: { uuid: params[:user_uuid] })
        # end
        render json: @deliveries
      end

      # GET /deliveries/1
      def show
        raise ActiveRecord::RecordNotFound if @delivery.nil?

        render json: @delivery
      end

      # POST /deliveries
      def create
        all_params = delivery_params

        @delivery = Delivery.new(all_params.except(:current_address, :from_address, :to_address, :current_status, :contact))
        acur = Address.new(all_params[:current_address].except(:gps_location)) if all_params[:current_address]
        acur.gps_location = GpsLocation.new(all_params[:current_address][:gps_location]) if all_params[:current_address][:gps_location]
        afrm = Address.new(all_params[:from_address].except(:gps_location)) if all_params[:from_address]
        afrm.gps_location = GpsLocation.new(all_params[:from_address][:gps_location]) if all_params[:from_address][:gps_location]
        atoa = Address.new(all_params[:to_address].except(:gps_location)) if all_params[:to_address]
        atoa.gps_location = GpsLocation.new(all_params[:to_address][:gps_location]) if all_params[:to_address][:gps_location]
        cda = DeliveryAddress.new(address: acur,
                                  address_types_id: AddressType.find_by_code('CURRENTADD').id,
                                  delivery: @delivery)
        fda = DeliveryAddress.new(address: afrm,
                                  address_types_id: AddressType.find_by_code('FROMADDRES').id,
                                  delivery: @delivery)
        tda = DeliveryAddress.new(address: atoa,
                                  address_types_id: AddressType.find_by_code('TOADDRESS').id,
                                  delivery: @delivery)
        @delivery.delivery_addresses << cda
        @delivery.delivery_addresses << fda
        @delivery.delivery_addresses << tda
        @delivery.build_contact(all_params[:contact])
        des = DeliveryStatus.new(local_datetime: all_params[:current_status][:local_datetime] || Time.now,
                                 status_id: Status.find_by_new_type_status(true).id,
                                 device_id: @current_device.id,
                                 delivery: @delivery)
        des.build_contact(all_params[:current_status][:contact])
        des.gps_locations.new(all_params[:current_status][:last_location]) if all_params[:current_status] && all_params[:current_status][:last_location]
        @delivery.delivery_statuses << des
        if @delivery.save
          # render json: @delivery, status: :created #, location: @delivery
          render json: @delivery, status: :created, serializer: ShortDeliverySerializer
        else
          render json: @delivery.errors, status: :unprocessable_entity
        end
      end

      # def pickup
      #   controller_you_want = DeliveryStatusesController.new
      #   controller_you_want.request = request
      #   controller_you_want.response = response
      #   render json: controller_you_want.process(:pickup)
      # end

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

      def set_context
        # what is context
        @context = if params[:user_uuid]
                     :user_context
                   elsif params[:client_uuid]
                     :client_context
                   elsif params[:device_uuid]
                     :device_context
                   else
                     :unknown_context
                   end
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_delivery
        @delivery = Delivery.find_by_uuid!(params[:uuid])
      end

      # Only allow a trusted parameter "white list" through.
      def delivery_params
        load_params = params.require(:delivery).permit(:uuid,
                                          :orderer_name,
                                          :orderer_email,
                                          :amount_on_delivery,
                                          :annotation)
        load_params[:supplier_id] = @current_user.id if @current_user
        if params[:orderer_email]
          usr = User.find_by_email(params[:orderer_email])
          load_params[:orderer_id] = usr.id if usr
        end
        load_params[:courier_id] = User.find_by_uuid!(params[:courier_uuid]).id if params[:courier_uuid]
        load_params[:current_address] = params[:current_address] if params[:current_address]
        load_params[:from_address] = params[:from_address] if params[:from_address]
        load_params[:to_address] = params[:to_address] if params[:to_address]
        load_params[:current_status] = params[:current_status] if params[:current_status]
        load_params[:contact] = params[:contact] if params[:contact]
        load_params.permit!
        load_params
      end
    end
  end
end
