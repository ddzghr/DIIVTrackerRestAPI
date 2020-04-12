# ruby encoding: utf-8
after :account_types, :device_types do
  # APIMASTER
  AccountTypeDeviceType.create!(account_type_id: AccountType.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('APISER').id, applicable:true)
  AccountTypeDeviceType.create!(account_type_id: AccountType.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id, applicable:true)
  AccountTypeDeviceType.create!(account_type_id: AccountType.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('CLIDESKTOP').id, applicable:true)
  AccountTypeDeviceType.create!(account_type_id: AccountType.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id, applicable:true)
  AccountTypeDeviceType.create!(account_type_id: AccountType.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id, applicable:true)
  # TRACKSERV
  AccountTypeDeviceType.create!(account_type_id: AccountType.find_by_code('TRACKSERV').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id, applicable:true)
  # COURCUST
  AccountTypeDeviceType.create!(account_type_id: AccountType.find_by_code('COURCUST').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id, applicable:true)
  AccountTypeDeviceType.create!(account_type_id: AccountType.find_by_code('COURCUST').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id, applicable:true)
  # SUPPCUST
  AccountTypeDeviceType.create!(account_type_id: AccountType.find_by_code('SUPPCUST').id, device_type_id: DeviceType.find_by_code('CLIDESKTOP').id, applicable:true)
end
