class Delivery < ApplicationRecord
  has_uuid
  belongs_to :orderer, class_name: 'User'
  belongs_to :supplier, class_name: 'User'
  belongs_to :courier, class_name: 'User'
  has_many :delivery_addresses
  has_many :address_types, through: :delivery_addresses
  has_many :delivery_statuses
  has_one :current_address,
          -> {joins :address_types, where(address_types: { code: 'CURRENT' }) },
          as: :addressable, through: :delivery_addresses, class_name: 'Address'
  has_one :from_address,
          -> {joins :address_types, where(address_types: { code: 'FROM' }) },
          as: :addressable, through: :delivery_addresses, class_name: 'Address'
  has_one :to_address,
          -> {joins :address_types, where(address_types: { code: 'TO' }) },
          as: :addressable, through: :delivery_addresses, class_name: 'Address'
  has_one :current_status, -> { order('id DESC').limit(1) },
          class_name: 'DeliveryStatus'
end
