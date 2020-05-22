# ruby encoding: utf-8
# after :statuses, :device_types, :devices, :deliveries do
ns = Status.find_by_new_type_status(true)
dev = Device.find_by_device_type_id(DeviceType.find_by_code('CLIDESKTOP').id)
Delivery.all.each do |d|
  ds = DeliveryStatus.new(local_datetime: Time.now, status: ns, device_id: dev, delivery_id: d.id)
  ds.save
end
# end
