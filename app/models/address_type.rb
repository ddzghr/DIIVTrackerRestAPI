class AddressType < ApplicationRecord
  has_many :delivery_addresses
  has_many :deliveries, through: :delivery_addresses
end
