# app/serializers/api/v1/device_type_serializer.rb
module Api
  module V1
    class DeviceTypeSerializer < ActiveModel::Serializer
      attributes :id, :code, :name, :internal_api_server_type, :internal_web_server_type, :desktop_type, :web_server_type, :mobile_type
    end
  end
end
