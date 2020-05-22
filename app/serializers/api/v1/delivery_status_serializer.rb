# app/serializers/api/v1/delivery_status_serializer.rb
# frozen_string_literal: true
module Api
  module V1
    class DeliveryStatusSerializer < ActiveModel::Serializer
      attributes :id, :local_datetime
      has_one :delivery, serializer: ShortDeliverySerializer do
        options[:root] = false
        object.delivery
      end
      has_one :status, serializer: ShortStatusSerializer do
        options[:root] = false
        object.status
      end
      has_one :device, serializer: ShortDeviceSerializer do
        options[:root] = false
        object.device
      end
      has_one :assigned_device, serializer: ShortDeviceSerializer do
        options[:root] = false
        object.assigned_device
      end
    end
  end
end
