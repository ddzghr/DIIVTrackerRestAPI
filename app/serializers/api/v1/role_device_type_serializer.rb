# app/serializers/api/v1/role_device_type_serializer.rb
module Api
  module V1
    class RoleDeviceTypeSerializer < ActiveModel::Serializer
      attributes :id, :applicable

      has_one :role, serializer: ShortRoleSerializer do
        options[:root] = false
        object.role
      end

      has_one :device_type, serializer: ShortDeviceTypeSerializer do
        options[:root] = false
        object.device_type
      end

    end
  end
end
