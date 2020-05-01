# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password {Faker::Internet.password }
    company_name { Faker::Company.name }
  end
end
