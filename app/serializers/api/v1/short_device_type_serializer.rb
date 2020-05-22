# app/serializers/api/v1/short_device_type_serializer.rb
module Api
  module V1
    class ShortDeviceTypeSerializer < ActiveModel::Serializer
      attributes :id, :code, :name
    end
  end
end
