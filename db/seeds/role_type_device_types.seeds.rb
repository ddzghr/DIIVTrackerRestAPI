# ruby encoding: utf-8
after :role_types, :device_types do
  # APIMASTER
  RoleTypeDeviceType.create!(role_type_id: RoleType.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('APISER').id, applicable:true)
  RoleTypeDeviceType.create!(role_type_id: RoleType.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id, applicable:true)
  RoleTypeDeviceType.create!(role_type_id: RoleType.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('CLIDESKTOP').id, applicable:true)
  RoleTypeDeviceType.create!(role_type_id: RoleType.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id, applicable:true)
  RoleTypeDeviceType.create!(role_type_id: RoleType.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id, applicable:true)
  # TRACKSERV
  RoleTypeDeviceType.create!(role_type_id: RoleType.find_by_code('TRACKSERV').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id, applicable:true)
  # COURCUST
  RoleTypeDeviceType.create!(role_type_id: RoleType.find_by_code('COURCUST').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id, applicable:true)
  RoleTypeDeviceType.create!(role_type_id: RoleType.find_by_code('COURCUST').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id, applicable:true)
  # SUPPCUST
  RoleTypeDeviceType.create!(role_type_id: RoleType.find_by_code('SUPPCUST').id, device_type_id: DeviceType.find_by_code('CLIDESKTOP').id, applicable:true)
end
