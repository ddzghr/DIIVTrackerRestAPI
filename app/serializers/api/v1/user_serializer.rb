# app/serializers/api/v1/user_serializer.rb
module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :uuid, :name, :email, :company_name, :user_active, :user_locked, :email_confirmed
    end
  end
end
