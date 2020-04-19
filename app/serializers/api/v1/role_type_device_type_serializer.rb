# app/serializers/api/v1/role_type_device_type_serializer.rb
module Api
  module V1
    class RoleTypeDeviceTypeSerializer < ActiveModel::Serializer
      attributes :id, :applicable
      has_one :role_type
      has_one :device_type
    end
  end
end
