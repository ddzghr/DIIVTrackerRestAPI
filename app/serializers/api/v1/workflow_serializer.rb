# app/serializers/api/v1/workflow_serializer.rb
module Api
  module V1
    class WorkflowSerializer < ActiveModel::Serializer
      attributes :id
      has_one :old_status, serializer: ShortStatusSerializer do
        options[:root] = false
        object.old_status
      end
      has_one :new_status, serializer: ShortStatusSerializer do
        options[:root] = false
        object.new_status
      end
      has_one :device_type, serializer: ShortDeviceTypeSerializer do
        options[:root] = false
        object.device_type
      end
    end
  end
end
