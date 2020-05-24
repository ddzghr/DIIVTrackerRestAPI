# app/serializers/api/v1/short_contact_serializer.rb
module Api
  module V1
    class ShortContactSerializer < ActiveModel::Serializer
      attributes :name, :phone
    end
  end
end
