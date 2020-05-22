# app/serializers/api/v1/short_status_serializer.rb
module Api
  module V1
    class ShortStatusSerializer < ActiveModel::Serializer
      attributes :id,
                 :code,
                 :name
    end
  end
end
