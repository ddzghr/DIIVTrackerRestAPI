# app/serializers/api/v1/delivery_status_serializer.rb
# frozen_string_literal: true
module Api
  module V1
    class DeliveryStatusSerializer < ActiveModel::Serializer
      attributes :id, :local_datetime
      has_one :delivery
      has_one :status
      has_one :device
      has_one :assigned_device
    end
  end
end
