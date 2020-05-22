# app/serializers/api/v1/short_delivery_serializer.rb
# frozen_string_literal: true
module Api
  module V1
    class ShortDeliverySerializer < ActiveModel::Serializer
      attributes :uuid
    end
  end
end
