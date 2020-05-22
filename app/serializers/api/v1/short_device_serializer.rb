# app/serializers/api/v1/device_serializer.rb
# frozen_string_literal: true
module Api
  module V1
    class ShortDeviceSerializer < ActiveModel::Serializer
      attributes :uuid
    end
  end
end
