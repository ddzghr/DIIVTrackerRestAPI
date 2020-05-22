# app/serializers/api/v1/status_serializer.rb
module Api
  module V1
    class StatusSerializer < ActiveModel::Serializer
      attributes :id,
                 :code,
                 :name,
                 :new_type_status,
                 :in_progress_type_status,
                 :stored_type_status,
                 :delivered_type_status,
                 :parent_status
      def parent_status
        object.status_id
      end
    end
  end
end
