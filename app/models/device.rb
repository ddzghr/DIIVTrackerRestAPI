class Device < ApplicationRecord
  has_uuid
  has_secret_token
  belongs_to :user
  belongs_to :device_type
  has_secure_token :confirm_token
  has_secure_token :unlock_token
  has_many :gps_locations, as: :locatable
end
