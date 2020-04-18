class RoleTypeDeviceType < ApplicationRecord
  belongs_to :role_type
  belongs_to :device_type
end
