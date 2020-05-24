# app/serializers/api/v1/device_serializer.rb
# frozen_string_literal: true
module Api
  module V1
    class DeviceSerializer < ActiveModel::Serializer
      attributes :uuid,
                 :name,
                 :valid_from,
                 :valid_through,
                 :device_active,
                 :device_confirmed,
                 :device_locked
      has_one :user, serializer: ShortUserSerializer do
        options[:root] = false
        object.user
      end
      has_one :device_type, serializer: ShortDeviceTypeSerializer do
        options[:root] = false
        object.device_type
      end
    end
  end
end
