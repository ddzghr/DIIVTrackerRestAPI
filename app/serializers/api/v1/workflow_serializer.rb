# app/serializers/api/v1/workflow_serializer.rb
module Api
  module V1
    class WorkflowSerializer < ActiveModel::Serializer
      attributes :id
      has_one :old_status
      has_one :new_status
      has_one :device_type
    end
  end
end
