# ruby encoding: utf-8
require 'faker'
after "development:deliveries", "development:delivery_statuses" do
  Delivery.all.each do |d|
    d.update!(contact: Contact.create(name: Faker::Name.name, phone: Faker::PhoneNumber.cell_phone_with_country_code))
  end
  DeliveryStatus.all.each do |ds|
    ds.update!(contact: Contact.create(name: Faker::Name.name, phone: Faker::PhoneNumber.cell_phone_with_country_code))
  end
end
