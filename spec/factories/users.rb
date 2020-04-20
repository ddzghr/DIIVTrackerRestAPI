# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password {Faker::Internet.password }
    company_name { Faker::Company.name }
    user_active { Faker::Boolean.boolean }
    user_locked { Faker::Boolean.boolean }
    email_confirmed { Faker::Boolean.boolean }
    confirm_token { Faker::Internet.device_token }
    password_reset_token { Faker::Internet.device_token }
  end
end
