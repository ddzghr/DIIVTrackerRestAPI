# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password {Faker::Internet.password }
    company_name { Faker::Commerce.name }
    user_active { Faker::Boolean }
    user_locked { Faker::Boolean }
    email_confirmed { Faker::Boolean }
    confirm_token { Faker::Internet.device_token }
    password_reset_token { Faker::Internet.device_token }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
