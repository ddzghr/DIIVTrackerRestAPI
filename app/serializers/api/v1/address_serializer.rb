# app/serializers/api/v1/address_serializer.rb
module Api
  module V1
    class AddressSerializer < ActiveModel::Serializer
      attributes :street,
                 :city_arrea_or_district,
                 :city_or_town_or_village,
                 :county,
                 :postal_code_and_name,
                 :country
      has_one :gps_location, serializer: ShortAddressGpsLocationSerializer do
        options[:root] = false
        object.gps_location
      end
    end
  end
end
