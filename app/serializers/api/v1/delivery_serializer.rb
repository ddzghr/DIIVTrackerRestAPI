# app/serializers/api/v1/delivery_serializer.rb
# frozen_string_literal: true
module Api
  module V1
    class DeliverySerializer < ActiveModel::Serializer
      attributes :id, :uuid, :email, :amount_on_delivery, :orderer_name, :orderer_email, :annotation
      has_one :orderer
      has_one :supplier
      has_one :courier
    end
  end
end
