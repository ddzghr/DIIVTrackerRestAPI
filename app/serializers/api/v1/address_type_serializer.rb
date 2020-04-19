# app/serializers/api/v1/addres_type_serializer.rb
module Api
  module V1
    class AddressTypeSerializer < ActiveModel::Serializer
      attributes :id, :code, :name
    end
  end
end
