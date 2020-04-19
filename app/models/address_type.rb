class AddressType < ApplicationRecord
  has_many :delivery_addresses
  has_many :deliveries, through: :delivery_addresses
  validates :code, length: { maximum: 10 },
                   presence: true,
                   uniqueness: true
  validates :name, length: { maximum: 50 },
                   presence: true
end
