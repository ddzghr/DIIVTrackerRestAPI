class Delivery < ApplicationRecord
  has_uuid
  belongs_to :orderer, class_name: 'User', optional: true
  belongs_to :supplier, class_name: 'User'
  belongs_to :courier, class_name: 'User'
  has_many :delivery_statuses
  has_many :delivery_addresses, inverse_of: :delivery
  has_many :address_types, through: :delivery_addresses
  has_many :addresses, through: :delivery_addresses, as: :addressable

  has_one :current_address,
          -> { joins(:address_type).where(address_types: { code: 'CURRENTADD' }) },
          class_name: 'DeliveryAddress'

  has_one :from_address,
          -> { joins(:address_type).where(address_types: { code: 'FROMADDRES' }) },
          class_name: 'DeliveryAddress'

  has_one :to_address,
          -> { joins(:address_type).where(address_types: { code: 'TOADDRESS' }) },
          class_name: 'DeliveryAddress'

  has_one :current_status, -> { order('id DESC').limit(1) },
          class_name: 'DeliveryStatus'

  has_one :contact, as: :contactable, required: false
end
