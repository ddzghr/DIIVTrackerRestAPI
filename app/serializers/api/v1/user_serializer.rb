# app/serializers/api/v1/user_serializer.rb
module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :uuid,
                 :name,
                 :email,
                 :company_name,
                 :user_active,
                 :user_locked,
                 :email_confirmed,
                 :force_password_change
      has_one :address, serializer: AddressSerializer do
        options[:root] = false
        object.address
      end
    end
  end
end
