# app/serializers/api/v1/short_role_serializer.rb
module Api
  module V1
    class ShortRoleSerializer < ActiveModel::Serializer
      attributes :id, :code, :name
    end
  end
end
