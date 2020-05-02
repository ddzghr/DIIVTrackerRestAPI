# app/serializers/api/v1/user_role_serializer.rb
module Api
  module V1
    class UserRoleSerializer < ActiveModel::Serializer
      attributes :id, :uuid, :invoice, :valid_from, :valid_through
      has_one :user
      has_one :role
    end
  end
end