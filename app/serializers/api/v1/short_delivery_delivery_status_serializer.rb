# app/serializers/api/v1/short_delivery_delivery_status_serializer.rb
# frozen_string_literal: true
module Api
  module V1
    class ShortDeliveryDeliveryStatusSerializer < ActiveModel::Serializer
      attributes :id,
                 :local_datetime
      has_one :last_location, serializer: ShortGpsLocationSerializer do
        options[:root] = false
        object.last_location
      end
      has_one :status, serializer: ShortStatusSerializer do
        options[:root] = false
        object.status
      end
      has_one :contact, serializer: ShortContactSerializer do
        options[:root] = false
        object.contact
      end
      has_one :destination, serializer: AddressSerializer do
        options[:root] = false
        object.destination
      end
    end
  end
end
