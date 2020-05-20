after :users, :device_types do
  Device.create(name: 'DIIVTrackerRestAPI',
                 secret_token: '6fLzBB1ApfJqPorhsUDG8VXG',
                 secret_token_confirmation: '6fLzBB1ApfJqPorhsUDG8VXG',
                 user_id: User.find_by_email('tracker@diiv.local').id,
                 device_type_id: DeviceType.find_by_code('APISER').id,
                 device_confirmed: true)

  Device.create(name: 'DIIVTrackerWEB',
                secret_token: 'YCEVBLHB7ZXfitAK2mDDjqBp',
                secret_token_confirmation: 'YCEVBLHB7ZXfitAK2mDDjqBp',
                user_id: User.find_by_email('web@diiv.local').id,
                device_type_id: DeviceType.find_by_code('DIIVWEBSER').id,
                device_confirmed: true)

  Device.create(name: 'Desktop',
                secret_token: 'NBYyNfUPsQCuNEbNqe8hSao7',
                secret_token_confirmation: 'NBYyNfUPsQCuNEbNqe8hSao7',
                user_id: User.find_by_email('dobavljac@diiv.local').id,
                device_type_id: DeviceType.find_by_code('CLIDESKTOP').id,
                device_confirmed: true)

  Device.create(name: 'KurirWEB',
                secret_token: 'AddW6FZ1nYyYQdA6vffS89oY',
                secret_token_confirmation: 'AddW6FZ1nYyYQdA6vffS89oY',
                user_id: User.find_by_email('kurir@diiv.local').id,
                device_type_id: DeviceType.find_by_code('CLIWEBSER').id,
                device_confirmed: true)

  Device.create(name: 'KurirMob',
                secret_token: 'hb8EwXvdodPv4ahSQURU9cS9',
                secret_token_confirmation: 'hb8EwXvdodPv4ahSQURU9cS9',
                user_id: User.find_by_email('kurir@diiv.local').id,
                device_type_id: DeviceType.find_by_code('CLIMOBDEV').id,
                device_confirmed: true)
end
