# app/serializers/api/v1/short_delivery_delivery_status_serializer.rb
# frozen_string_literal: true
module Api
  module V1
    class ShortDeliveryDeliveryStatusSerializer < ActiveModel::Serializer
      attributes :id, :local_datetime
      has_one :status, serializer: ShortStatusSerializer do
        options[:root] = false
        object.status
      end
    end
  end
end
