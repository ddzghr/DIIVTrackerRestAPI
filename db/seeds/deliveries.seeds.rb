# ruby encoding: utf-8
require 'faker'
after :users, :address_types do
  # delivery for non registered user
  fatid = AddressType.find_by_code('FROMADDRES').id
  catid = AddressType.find_by_code('CURRENTADD').id
  tatid = AddressType.find_by_code('TOADDRESS').id
  supid = User.find_by_email('dobavljac@diiv.local').id
  curid = User.find_by_email('kurir@diiv.local').id

  10.times do |i|
    isporuka1 = Delivery.new(orderer_email: 'netko@diiv.local',
                             orderer_name: 'Nekto Nepoznat',
                             orderer_id: nil,
                             supplier_id: supid,
                             courier_id: curid,
                             annotation: 'Test isporuka ' + i.to_s
                    )
    afrom = Address.new(street: Faker::Address.street_name + ' ' + Faker::Address.building_number, city_or_town_or_village: Faker::Address.city, postal_code_and_name: Faker::Address.postcode + ' ' + Faker::Address.city)
    acur = Address.new(street: Faker::Address.street_name + ' ' + Faker::Address.building_number, city_or_town_or_village: Faker::Address.city, postal_code_and_name: Faker::Address.postcode + ' ' + Faker::Address.city)
    ato = Address.new(street: Faker::Address.street_name + ' ' + Faker::Address.building_number, city_or_town_or_village: Faker::Address.city, postal_code_and_name: Faker::Address.postcode + ' ' + Faker::Address.city)
    cda = DeliveryAddress.new(address: acur,
                              address_types_id: catid,
                              delivery: isporuka1)
    fda = DeliveryAddress.new(address: afrom,
                             address_types_id: fatid,
                             delivery: isporuka1)
    tda = DeliveryAddress.new(address: ato,
                              address_types_id: tatid,
                              delivery: isporuka1)
    isporuka1.delivery_addresses << cda
    isporuka1.delivery_addresses << fda
    isporuka1.delivery_addresses << tda
    isporuka1.save!
  end
  # delivery for registered user
  narid = User.find_by_email('narucitelj@diiv.local').id
  10.times do |i|
    isporuka1 = Delivery.new(orderer_email: 'narucitelj@diiv.local',
                             orderer_name: 'Naručitelj',
                             orderer_id: narid,
                             supplier_id: supid,
                             courier_id: curid,
                             annotation: 'Test isporuka ' + i.to_s
    )
    afrom = Address.new(street: Faker::Address.street_name + ' ' + Faker::Address.building_number, city_or_town_or_village: Faker::Address.city, postal_code_and_name: Faker::Address.postcode + ' ' + Faker::Address.city)
    acur = Address.new(street: Faker::Address.street_name + ' ' + Faker::Address.building_number, city_or_town_or_village: Faker::Address.city, postal_code_and_name: Faker::Address.postcode + ' ' + Faker::Address.city)
    ato = Address.new(street: Faker::Address.street_name + ' ' + Faker::Address.building_number, city_or_town_or_village: Faker::Address.city, postal_code_and_name: Faker::Address.postcode + ' ' + Faker::Address.city)
    cda = DeliveryAddress.new(address: acur,
                              address_types_id: catid,
                              delivery: isporuka1)
    fda = DeliveryAddress.new(address: afrom,
                              address_types_id: fatid,
                              delivery: isporuka1)
    tda = DeliveryAddress.new(address: ato,
                              address_types_id: tatid,
                              delivery: isporuka1)
    isporuka1.delivery_addresses << cda
    isporuka1.delivery_addresses << fda
    isporuka1.delivery_addresses << tda
    isporuka1.save!
  end
end
