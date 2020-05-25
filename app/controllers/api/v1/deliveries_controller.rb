# app/controllers/api/v1/deliveries_controller.rb
# frozen_string_literal: true
module Api
  module V1
    # Handles deliveries
    class DeliveriesController < ApplicationController
      before_action :set_delivery, only: [:show, :update, :destroy]
      skip_authorization_check

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
        all_params = delivery_params

        @delivery = Delivery.new(all_params.except(:current_address, :from_address, :to_address, :current_status, :contact))
        acur = Address.new(all_params[:current_address].except(:gps_location))
        afrm = Address.new(all_params[:from_address].except(:gps_location))
        atoa = Address.new(all_params[:to_address].except(:gps_location))
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
        @delivery.contact = Contact.new(all_params[:contact])
        des = DeliveryStatus.new(local_datetime: all_params[:current_status][:local_datetime] || Time.now,
                                 status_id: Status.find_by_new_type_status(true).id,
                                 device_id: @current_device.id,
                                 delivery: @delivery)
        des.contact = Contact.new(all_params[:current_status][:contact])
        @delivery.delivery_statuses << des
        if @delivery.save
          # render json: @delivery, status: :created #, location: @delivery
          render json: @delivery, status: :created, serializer: ShortDeliverySerializer
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
        load_params = params.require(:delivery).permit(:uuid,
                                          :orderer_name,
                                          :orderer_email,
                                          :amount_on_delivery,
                                          :annotation)
        load_params[:supplier_id] = @current_user.id if @current_user
        load_params[:orderer_id] = User.find_by_uuid(params[:orderer_uuid]).id if params[:orderer_uuid]
        load_params[:courier_id] = User.find_by_uuid(params[:courier_uuid]).id if params[:courier_uuid]
        load_params[:current_address] = params[:current_address] if params[:current_address]
        load_params[:from_address] = params[:current_address] if params[:from_address]
        load_params[:to_address] = params[:current_address] if params[:to_address]
        load_params[:current_status] = params[:current_status] if params[:current_status]
        load_params[:contact] = params[:contact] if params[:contact]
        load_params.permit!
        load_params
        # params.require(:delivery).permit(:uuid,
        #                                  :orderer_name,
        #                                  :orderer_email,
        #                                  :amount_on_delivery,
        #                                  :orderer_uuid,
        #                                  # :supplier_uuid,
        #                                  :courier_uuid,
        #                                  :annotation,
        #                                  current_address: [
        #                                    :street,
        #                                    :city_arrea_or_district,
        #                                    :city_or_town_or_village,
        #                                    :county,
        #                                    :postal_code_and_name,
        #                                    :country,
        #                                    gps_location: [
        #                                      :gps_latitude,
        #                                      :gps_longitude
        #                                      ]
        #                                  ],
        #                                  from_address: [
        #                                    :street,
        #                                    :city_arrea_or_district, # TODO: correct arrea to area
        #                                    :city_or_town_or_village,
        #                                    :county,
        #                                    :postal_code_and_name,
        #                                    :country,
        #                                    gps_location: [
        #                                      :gps_latitude,
        #                                      :gps_longitude
        #                                    ]
        #                                  ],
        #                                  to_address: [
        #                                    :street,
        #                                    :city_arrea_or_district,
        #                                    :city_or_town_or_village,
        #                                    :county,
        #                                    :postal_code_and_name,
        #                                    :country,
        #                                    gps_location: [
        #                                      :gps_latitude,
        #                                      :gps_longitude
        #                                    ]
        #                                  ],
        #                                  current_status: [
        #                                    :local_datetime,
        #                                    last_location: [
        #                                      :gps_latitude,
        #                                      :gps_longitude
        #                                    ],
        #                                    contact: [
        #                                      :name,
        #                                      :phone
        #                                    ]
        #                                  ],
        #                                  contact: [
        #                                    :name,
        #                                    :phone
        #                                  ])
      end
    end
  end
end
