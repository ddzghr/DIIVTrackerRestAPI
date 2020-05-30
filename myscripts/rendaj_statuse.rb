require 'faker'

Delivery.all.each do |d|
  puts d.uuid + ' : ' + d.current_status.status.name unless d.current_status.nil? || d.current_status.status.nil?
  puts d.uuid + ' : ' + 'NEMA STATUSA' if d.current_status.nil? || d.current_status.status.nil?
end
