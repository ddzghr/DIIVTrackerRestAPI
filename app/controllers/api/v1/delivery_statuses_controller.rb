# app/controllers/api/v1/delivery-statuses_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class DeliveryStatusesController < ApplicationController
      before_action :set_delivery_status, only: %i[show update destroy]
      skip_authorization_check
      # actions that require destination
      DESTINATION_ACTIONS = %i[assign accept pickup].freeze
      # actions that require destination fallbacks
      DESTINATION_PREVIOUS = %i[accept].freeze
      DESTINATION_FROM = %i[accept].freeze
      DESTINATION_TO = %i[pickup].freeze
      # actions that set current address
      CURRENT_ADDRESS_ACTIONS = %i[store deliver].freeze
      CURRENT_ADDRESS_PREVIOUS = %i[store].freeze
      CURRENT_ADDRESS_TO = %i[deliver].freeze

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
      def pickup
        all_params = delivery_status_params
        #render json: all_params, status: :ok and return
        delivery = Delivery.find(all_params[:delivery_id])
        device = Device.find(all_params[:device_id])
        status = nil
        unless delivery.current_status.nil? || delivery.current_status.status.nil?
          workflow = Workflow.joins(:new_status)
                           .joins(:old_status)
                           .where(device_type_id: device.device_type.id,
                                  old_status_id: delivery.current_status.status.id,
                                  statuses: { in_progress_type_status: true,
                                              code: %w[INPROGRESS] })
                           .first
          status = workflow.new_status unless workflow.nil?
        end
        render json: 'Invalid workflow on pickup', status: :unprocessable_entity and return if status.nil?

        delivery_status_create_error = create_delivery_status?(delivery, status, all_params, device.id, nil)
        render json: 'Missing destination on store', status: :unprocessable_entity and return if delivery_status_create_error

        saved = persist_all?

        if saved
          render json: @delivery_status, status: :created #, location: @delivery_status
        else
          render json: @delivery_status.errors, status: :unprocessable_entity
        end
      end

      # POST /delivery_statuses
      def accept
        all_params = delivery_status_params
        # render json: all_params, status: :ok
        delivery = Delivery.find(all_params[:delivery_id])
        device = Device.find(all_params[:device_id])
        status = nil
        unless delivery.current_status.nil? || delivery.current_status.status.nil?
          status = Workflow.joins(:new_status)
                           .joins(:old_status)
                           .where(device_type_id: device.device_type.id,
                                  old_status_id: delivery.current_status.status.id,
                                  statuses: { new_type_status: delivery.current_status.status.new_type_status,
                                              stored_type_status: delivery.current_status.status.stored_type_status,
                                              code: %w[ACCNEW ACCNEWACC STOREDACC] })
                           .first
                           .new_status
        end
        render json: 'Invalid workflow on accept', status: :unprocessable_entity and return if status.nil?

        delivery_status_create_error = create_delivery_status?(delivery, status, all_params, delivery.current_status.device.id, device.id)
        render json: 'Missing destination on accept', status: :unprocessable_entity and return if delivery_status_create_error

        saved = persist_all?

        if saved
          render json: @delivery_status, status: :created #, location: @delivery_status
        else
          render json: @delivery_status.errors, status: :unprocessable_entity
        end
      end

      # POST /delivery_statuses
      def assign
        all_params = delivery_status_params
        # render json: all_params, status: :ok
        delivery = Delivery.find(all_params[:delivery_id])
        device = Device.find(all_params[:device_id])
        assign_device = Device.find(all_params[:assign_device_id])
        status = nil
        unless delivery.current_status.nil? || delivery.current_status.status.nil?
          status = Workflow.joins(:new_status)
                           .joins(:old_status)
                           .where(device_type_id: device.device_type.id,
                                  old_status_id: delivery.current_status.status.id,
                                  statuses: { new_type_status: delivery.current_status.status.new_type_status,
                                              stored_type_status: delivery.current_status.status.stored_type_status,
                                              code: %w[ACCNEWASS STOREDASS] })
                           .first
                           .new_status
        end
        render json: 'Invalid workflow on assign', status: :unprocessable_entity and return if status.nil?

        delivery_status_create_error = create_delivery_status?(delivery, status, all_params, delivery.current_status.device.id, assign_device.id)
        render json: 'Missing destination on assign', status: :unprocessable_entity and return if delivery_status_create_error

        saved = persist_all?

        if saved
          render json: @delivery_status, status: :created #, location: @delivery_status
        else
          render json: @delivery_status.errors, status: :unprocessable_entity
        end
      end

      # POST /delivery_statuses
      def reject
        all_params = delivery_status_params
        # render json: all_params, status: :ok
        delivery = Delivery.find(all_params[:delivery_id])
        device = Device.find(all_params[:device_id])
        status = nil
        unless delivery.current_status.nil? || delivery.current_status.status.nil?
          status = Workflow.joins(:new_status)
                           .joins(:old_status)
                           .where(device_type_id: device.device_type.id,
                                  old_status_id: delivery.current_status.status.id,
                                  statuses: { new_type_status: delivery.current_status.status.new_type_status,
                                              stored_type_status: delivery.current_status.status.stored_type_status,
                                              code: %w[ACCNEWREJ STOREDREJ] })
                           .first
                           .new_status
        end
        render json: 'Invalid workflow on reject', status: :unprocessable_entity and return if status.nil?

        delivery_status_create_error = create_delivery_status?(delivery, status, all_params, delivery.current_status.device.id, device.id)
        render json: 'Missing destination on reject', status: :unprocessable_entity and return if delivery_status_create_error

        saved = persist_all?

        if saved
          render json: @delivery_status, status: :created #, location: @delivery_status
        else
          render json: @delivery_status.errors, status: :unprocessable_entity
        end
      end

      # POST /delivery_statuses
      def store
        all_params = delivery_status_params
        # render json: all_params, status: :ok
        delivery = Delivery.find(all_params[:delivery_id])
        device = Device.find(all_params[:device_id])
        status = nil
        unless delivery.current_status.nil? || delivery.current_status.status.nil?
          status = Workflow.joins(:new_status)
                           .joins(:old_status)
                           .where(device_type_id: device.device_type.id,
                                  old_status_id: delivery.current_status.status.id,
                                  statuses: { stored_type_status: true,
                                              code: %w[STORED] })
                           .first
                           .new_status
        end
        render json: 'Invalid workflow on store', status: :unprocessable_entity and return if status.nil?

        delivery_status_create_error = create_delivery_status?(delivery, status, all_params, device.id, nil)
        render json: 'Missing destination on store', status: :unprocessable_entity and return if delivery_status_create_error

        saved = persist_all?

        if saved
          render json: @delivery_status, status: :created #, location: @delivery_status
        else
          render json: @delivery_status.errors, status: :unprocessable_entity
        end
      end

      # POST /delivery_statuses
      def deliver
        all_params = delivery_status_params
        # render json: all_params, status: :ok
        delivery = Delivery.find(all_params[:delivery_id])
        device = Device.find(all_params[:device_id])
        status = nil
        unless delivery.current_status.nil? || delivery.current_status.status.nil?
          status = Workflow.joins(:new_status)
                       .joins(:old_status)
                       .where(device_type_id: device.device_type.id,
                              old_status_id: delivery.current_status.status.id,
                              statuses: { delivered_type_status: true,
                                          code: %w[DELIVERED] })
                       .first
                       .new_status
        end
        render json: 'Invalid workflow on delivery', status: :unprocessable_entity and return if status.nil?

        delivery_status_create_error = create_delivery_status?(delivery, status, all_params, device.id, nil)
        render json: 'Missing destination on delivery', status: :unprocessable_entity and return if delivery_status_create_error

        saved = persist_all?

        if saved
          render json: @delivery_status, status: :created #, location: @delivery_status
        else
          render json: @delivery_status.errors, status: :unprocessable_entity
        end
      end

      # POST /delivery_statuses
      def lost
        all_params = delivery_status_params
        # render json: all_params, status: :ok
        delivery = Delivery.find(all_params[:delivery_id])
        device = Device.find(all_params[:device_id])
        status = nil
        unless delivery.current_status.nil? || delivery.current_status.status.nil?
          status = Workflow.joins(:new_status)
                       .joins(:old_status)
                       .where(device_type_id: device.device_type.id,
                              old_status_id: delivery.current_status.status.id,
                              statuses: { delivered_type_status: true,
                                          code: %w[LOST] })
                       .first
                       .new_status
        end
        render json: 'Invalid workflow on lost', status: :unprocessable_entity and return if status.nil?

        delivery_status_create_error = create_delivery_status?(delivery, status, all_params, device.id, nil)
        render json: 'Missing destination on lost', status: :unprocessable_entity and return if delivery_status_create_error

        saved = persist_all?

        if saved
          render json: @delivery_status, status: :created #, location: @delivery_status
        else
          render json: @delivery_status.errors, status: :unprocessable_entity
        end
      end

      # POST /delivery_statuses
      def cancel
        all_params = delivery_status_params
        # render json: all_params, status: :ok
        delivery = Delivery.find(all_params[:delivery_id])
        device = Device.find(all_params[:device_id])
        status = nil
        unless delivery.current_status.nil? || delivery.current_status.status.nil?
          status = Workflow.joins(:new_status)
                       .joins(:old_status)
                       .where(device_type_id: device.device_type.id,
                              old_status_id: delivery.current_status.status.id,
                              statuses: { delivered_type_status: true,
                                          code: %w[CANCELED] })
                       .first
                       .new_status
        end
        render json: 'Invalid workflow on cancel', status: :unprocessable_entity and return if status.nil?

        delivery_status_create_error = create_delivery_status?(delivery, status, all_params, device.id, nil)
        render json: 'Missing destination on cancel', status: :unprocessable_entity and return if delivery_status_create_error

        saved = persist_all?

        if saved
          render json: @delivery_status, status: :created #, location: @delivery_status
        else
          render json: @delivery_status.errors, status: :unprocessable_entity
        end
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

      def persist_all?
        saved = false
        @delivery_status.transaction do
          @delivery_status.save
          unless @delivery_status.delivery.current_address.nil?
            unless @delivery_status.delivery.current_address.address.nil?
              @delivery_status.delivery.current_address.address.save unless @delivery_status.delivery.current_address.address.persisted?
              unless @delivery_status.delivery.current_address.address.gps_location.nil?
                @delivery_status.delivery.current_address.address.gps_location.save unless @delivery_status.delivery.current_address.address.gps_location.persisted?
              end
            end
          end
          saved = true
        end
        saved
      end

      def create_delivery_status?(delivery, status, all_params, device_id, assigned_device_id)
        delivery_status_create_error = false
        @delivery_status = DeliveryStatus.new(local_datetime: all_params[:local_datetime] || Time.now,
                                              status_id: status.id,
                                              device_id: device_id,
                                              assigned_device_id: assigned_device_id,
                                              delivery_id: all_params[:delivery_id])

        @delivery_status.gps_locations.new(all_params[:last_location]) if all_params[:last_location]
        @delivery_status.build_contact(all_params[:contact]) if all_params[:contact]

        if DESTINATION_ACTIONS.include?(params[:action].parameterize.underscore.to_sym)
          if all_params[:destination]
            @delivery_status.build_destination(all_params[:destination].except(:gps_location))
            @delivery_status.destination.build_gps_location(all_params[:destination][:gps_location]) if all_params[:destination][:gps_location]
          elsif DESTINATION_PREVIOUS.include?(params[:action].parameterize.underscore.to_sym) && !delivery.current_status.nil? && !delivery.current_status.destination.nil?
            @delivery_status.destination = delivery.current_status.destination.dup
            @delivery_status.destination.gps_location = delivery.current_status.destination.gps_location.dup unless delivery.current_status.destination.gps_location.nil?
          elsif DESTINATION_FROM.include?(params[:action].parameterize.underscore.to_sym) && !delivery.from_address.nil? && !delivery.from_address.address.nil?
            @delivery_status.destination =  delivery.from_address.address.dup
            @delivery_status.destination.gps_location = delivery.from_address.address.gps_location.dup unless delivery.from_address.address.gps_location.nil?
          elsif DESTINATION_TO.include?(params[:action].parameterize.underscore.to_sym) && !delivery.to_address.nil? && !delivery.to_address.address.nil?
            @delivery_status.destination =  delivery.to_address.address.dup
            @delivery_status.destination.gps_location = delivery.to_address.address.gps_location.dup unless delivery.to_address.address.gps_location.nil?
          end
          delivery_status_create_error = true if @delivery_status.destination.nil?
        end

        if !delivery_status_create_error && CURRENT_ADDRESS_ACTIONS.include?(params[:action].parameterize.underscore.to_sym)
          if all_params[:destination]
            @delivery_status.delivery.current_address.address.assign_attributes(all_params[:destination].except(:gps_location))
            @delivery_status.delivery.current_address.address.gps_location.assign_attributes(all_params[:destination][:gps_location]) if all_params[:destination][:gps_location]
          elsif CURRENT_ADDRESS_PREVIOUS.include?(params[:action].parameterize.underscore.to_sym) && !delivery.current_status.nil? && !delivery.current_status.destination.nil?
            @delivery_status.delivery.current_address.address = delivery.current_status.destination.dup
            @delivery_status.delivery.current_address.address.gps_location = delivery.current_status.destination.gps_location.dup unless delivery.current_status.destination.gps_location.nil?
          elsif CURRENT_ADDRESS_TO.include?(params[:action].parameterize.underscore.to_sym) && !delivery.to_address.nil? && !delivery.to_address.address.nil?
            @delivery_status.delivery.current_address.address = delivery.to_address.address.dup
            @delivery_status.delivery.current_address.address.gps_location = delivery.to_address.address.gps_location.dup unless delivery.to_address.address.gps_location.nil?
          else
            delivery_status_create_error = true
          end
        end
        delivery_status_create_error
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_delivery_status
        @delivery_status = DeliveryStatus.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def delivery_status_params
        load_params = params.require(:delivery_status).permit( :id,
                                                               :delivery_id,
                                                               :status_id,
                                                               :device_id,
                                                               :local_datetime,
                                                               :assigned_device_id)

        load_params[:delivery_id] = Delivery.find_by_uuid(params[:delivery_uuid]).id if params[:delivery_uuid]
        load_params[:delivery_id] = Delivery.find_by_uuid(params[:uuid]).id if params[:uuid]
        load_params[:device_id] = Device.find_by_uuid(params[:device_uuid]).id if params[:device_uuid]
        load_params[:assigned_device_id] = Device.find_by_uuid(params[:assigned_device_uuid]).id if params[:assigned_device_uuid]
        if params[:delivery_status][:last_location]
          load_params[:last_location] = params[:delivery_status][:last_location]
        end
        load_params[:contact] = params[:delivery_status][:contact] if params[:delivery_status][:contact]
        load_params[:destination] = params[:delivery_status][:destination] if params[:delivery_status][:destination]
        load_params.permit!
        load_params

      end
    end
  end
end
