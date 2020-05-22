# app/serializers/api/v1/user_role_serializer.rb
module Api
  module V1
    class UserRoleSerializer < ActiveModel::Serializer
      attributes :uuid, :invoice, :valid_from, :valid_through
      has_one :user, serializer: ShortUserSerializer do
        options[:root] = false
        object.user
      end
      has_one :role, serializer: ShortRoleSerializer do
        options[:root] = false
        object.role
      end
    end
  end
end