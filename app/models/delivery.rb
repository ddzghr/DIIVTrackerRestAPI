class Delivery < ApplicationRecord
  belongs_to :orderer, class_name: 'User'
  belongs_to :supplier, class_name: 'User'
  belongs_to :courier, class_name: 'User'
  has_one :from_address
  has_one :to_address
  has_one :address_from, through: :from_address , class_name: 'Address'
  has_one :address_to, through: :to_address, class_name: 'Address'
end
