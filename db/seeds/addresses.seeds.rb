# ruby encoding: utf-8
require 'faker'
#after :delivery_statuses do
DeliveryStatus.all.each do |ds|
  ds.update!(destination: Address.create(street: Faker::Address.street_name + ' ' + Faker::Address.building_number, city_or_town_or_village: Faker::Address.city, postal_code_and_name: Faker::Address.postcode + ' ' + Faker::Address.city))
end
#end
