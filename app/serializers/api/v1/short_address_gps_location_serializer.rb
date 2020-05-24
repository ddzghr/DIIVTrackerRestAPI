# app/serializers/api/v1/short_address_gps_location_serializer.rb
module Api
  module V1
    class ShortAddressGpsLocationSerializer < ActiveModel::Serializer
      attributes :gps_latitude,
                 :gps_longitude
    end
  end
end
