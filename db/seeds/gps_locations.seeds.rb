# ruby encoding: utf-8
require 'faker'
after :delivery_statuses, :addresses do
  DeliveryStatus.all.each do |ds|
    ds.update!(gps_locations: [] << GpsLocation.new(gps_latitude: Faker::Address.latitude, gps_longitude: Faker::Address.longitude))
  end
  Address.all.each do |ad|
    ad.update!(gps_location: GpsLocation.new(gps_latitude: Faker::Address.latitude, gps_longitude: Faker::Address.longitude))
  end
end
