# app/serializers/api/v1/gps_location_serializer.rb
module Api
  module V1
    class GpsLocationSerializer < ActiveModel::Serializer
      attributes :id,
                 :gps_latitude,
                 :gps_longitude,
                 :created_at
    end
  end
end
