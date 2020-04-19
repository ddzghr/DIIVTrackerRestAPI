# app/serializers/api/v1/role_type_serializer.rb
module Api
  module V1
    class RoleTypeSerializer < ActiveModel::Serializer
      attributes :id, :code, :name, :internal_admin_type, :internal_application_type, :ordering_party_type, :courier_type, :supplier_type, :has_duration, :has_invoice
    end
  end
end
