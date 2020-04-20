class RoleDeviceType < ApplicationRecord
  belongs_to :role
  belongs_to :device_type
end
