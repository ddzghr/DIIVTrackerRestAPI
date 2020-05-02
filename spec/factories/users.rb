# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { '462sadfs87346hgjfhfg726rtrt736472' }
    password_confirmation { '462sadfs87346hgjfhfg726rtrt736472' }
    company_name { Faker::Company.name }
  end
end
