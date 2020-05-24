# app/serializers/api/v1/short_gps_location_serializer.rb
module Api
  module V1
    class ShortGpsLocationSerializer < ActiveModel::Serializer
      attributes :id,
                 :gps_latitude,
                 :gps_longitude,
                 :created_at
    end
  end
end
