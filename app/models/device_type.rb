class DeviceType < ApplicationRecord
  has_many :devices
  has_many :users, through: :devices
  has_many :workflows
end
