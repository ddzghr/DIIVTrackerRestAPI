# app/serializers/api/v1/role_device_type_serializer.rb
module Api
  module V1
    class RoleDeviceTypeSerializer < ActiveModel::Serializer
      attributes :id, :applicable
      has_one :role
      has_one :device_type
    end
  end
end
