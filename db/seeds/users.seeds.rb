# ruby encoding: utf-8
require 'faker'
User.create(name: 'Administrator',
            email: 'admin@diiv.local',
            password: 'adminpass!1',
            password_confirmation: 'adminpass!1',
            company_name: 'DIIV',
            email_confirmed: true)

User.create(name: 'DIIV Tracker',
            email: 'tracker@diiv.local',
            password: 'adminpass!2',
            password_confirmation: 'adminpass!2',
            company_name: 'DIIV',
            email_confirmed: true)

User.create(name: 'DIIV WEB',
            email: 'web@diiv.local',
            password: 'adminpass!3',
            password_confirmation: 'adminpass!3',
            company_name: 'DIIV',
            email_confirmed: true)

dobavljac = User.create(name: 'Dobavljačev administrator',
                        email: 'dobavljac@diiv.local',
                        password: 'dobavljac!1',
                        password_confirmation: 'dobavljac!1',
                        company_name: 'Neki dobavljač d.d.',
                        email_confirmed: true)
dobavljac.update(address: Address.create(street: Faker::Address.street_name + ' ' + Faker::Address.building_number, city_or_town_or_village: Faker::Address.city, postal_code_and_name: Faker::Address.postcode + ' ' + Faker::Address.city))

kurir = User.create(name: 'Kurirov administrator',
                    email: 'kurir@diiv.local',
                    password: 'kurirov!1',
                    password_confirmation: 'kurirov!1',
                    company_name: 'Neki kurir d.d.',
                    email_confirmed: true)
kurir.update(address: Address.create(street: Faker::Address.street_name + ' ' + Faker::Address.building_number, city_or_town_or_village: Faker::Address.city, postal_code_and_name: Faker::Address.postcode + ' ' + Faker::Address.city))

narucitelj = User.create(name: 'Naručitelj',
                         email: 'narucitelj@diiv.local',
                         password: 'narucitelj!1',
                         password_confirmation: 'narucitelj!1',
                         email_confirmed: true)
narucitelj.update(address: Address.create(street: Faker::Address.street_name + ' ' + Faker::Address.building_number, city_or_town_or_village: Faker::Address.city, postal_code_and_name: Faker::Address.postcode + ' ' + Faker::Address.city))
