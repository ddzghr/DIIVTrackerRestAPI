class Delivery < ApplicationRecord
  belongs_to :orderer, class_name: 'User'
  belongs_to :supplier, class_name: 'User'
  belongs_to :courier, class_name: 'User'
  has_one :address_current,
          as: :addressable,
          dependent: :destroy,
          class_name: 'Address'
  has_one :from_address, dependent: :destroy
  has_one :to_address, dependent: :destroy
  has_one :address_from,
          as: :addressable,
          dependent: :destroy,
          through: :from_address,
          class_name: 'Address'
  has_one :address_to,
          as: :addressable,
          dependent: :destroy,
          through: :to_address,
          class_name: 'Address'
  has_many :delivery_statuses
end
