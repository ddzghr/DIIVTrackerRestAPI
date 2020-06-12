# ruby encoding: utf-8
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
dobavljac = User.create(name: 'Ivor Anđelković',
                        email: 'ivor.andelkovic@racunarstvo.hr',
                        password: 'dobavljac!1',
                        password_confirmation: 'dobavljac!1',
                        company_name: 'Neki dobavljač d.d.',
                        email_confirmed: true)
dobavljac.update(address: Address.create(street: 'Anina ulica 24', city_or_town_or_village: 'Zagreb', postal_code_and_name: '10020 Zagreb'))
dobavljac.address.update(gps_location: GpsLocation.create(gps_latitude: 45.7968452, gps_longitude: 15.9283881))

kurir = User.create(name: 'Ivan Opačak',
                    email: 'opacak.ivan@racunarstvo.hr',
                    password: 'kurirov!1',
                    password_confirmation: 'kurirov!1',
                    company_name: 'Neki kurir d.d.',
                    email_confirmed: true)
kurir.update(address: Address.create(street: 'Horvatova 10', city_or_town_or_village: 'Zagreb', postal_code_and_name: '10010 Zagreb'))
kurir.address.update(gps_location: GpsLocation.create(gps_latitude: 45.7613089, gps_longitude: 15.9783406))

narucitelj = User.create(name: 'Dominik Đukić',
                         email: 'dominik.dukic@racunarstvo.hr',
                         password: 'narucitelj!1',
                         password_confirmation: 'narucitelj!1',
                         email_confirmed: true)
narucitelj.update(address: Address.create(street: 'Trgovačka 19', city_or_town_or_village: 'Zagreb', postal_code_and_name: '10040 Zagreb'))
narucitelj.address.update(gps_location: GpsLocation.create(gps_latitude: 45.7848517, gps_longitude: 16.0300181))