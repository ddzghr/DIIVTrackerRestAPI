# ruby encoding: utf-8
after :roles, :device_types do
  # APIMASTER
  RoleDeviceType.create!(role_id: Role.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('APISER').id, applicable:true)
  RoleDeviceType.create!(role_id: Role.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id, applicable:true)
  RoleDeviceType.create!(role_id: Role.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('CLIDESKTOP').id, applicable:true)
  RoleDeviceType.create!(role_id: Role.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id, applicable:true)
  RoleDeviceType.create!(role_id: Role.find_by_code('APIMASTER').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id, applicable:true)
  # TRACKSERV
  RoleDeviceType.create!(role_id: Role.find_by_code('TRACKSERV').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id, applicable:true)
  # COURCUST
  RoleDeviceType.create!(role_id: Role.find_by_code('COURCUST').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id, applicable:true)
  RoleDeviceType.create!(role_id: Role.find_by_code('COURCUST').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id, applicable:true)
  # SUPPCUST
  RoleDeviceType.create!(role_id: Role.find_by_code('SUPPCUST').id, device_type_id: DeviceType.find_by_code('CLIDESKTOP').id, applicable:true)
end
