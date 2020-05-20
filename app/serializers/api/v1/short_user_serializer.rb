# app/serializers/api/v1/user_serializer.rb
module Api
  module V1
    class ShortUserSerializer < ActiveModel::Serializer
      attributes :uuid,
                 :name,
                 :email,
                 :company_name
    end
  end
end
