# spec/factories/roles.rb
FactoryBot.define do
  factory :role do
    code { Faker::Lorem.characters[0..9].upcase }
    name { Faker::Lorem.words(number: 5).join(' ').capitalize }
    internal_admin_type { Faker::Boolean.boolean }
    internal_application_type { Faker::Boolean.boolean }
    ordering_party_type { Faker::Boolean.boolean }
    courier_type { Faker::Boolean.boolean }
    supplier_type { Faker::Boolean.boolean }
    has_duration { Faker::Boolean.boolean }
    has_invoice { Faker::Boolean.boolean }
  end
end
