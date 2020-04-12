# spec/factories/account_types.rb
FactoryBot.define do
  factory :account_type do
    code { Faker::Lorem.characters[0..9].upcase }
    name { Faker::Lorem.words(number: 5).join(' ').capitalize }
    internal_admin_type { Faker::Boolean }
    internal_application_type { Faker::Boolean }
    ordering_party_type { Faker::Boolean }
    courier_type { Faker::Boolean }
    supplier_type { Faker::Boolean }
    has_duration { Faker::Boolean }
    has_invoice { Faker::Boolean }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
