class Delivery < ApplicationRecord
  belongs_to :orderer, class_name: 'User'
  belongs_to :supplier, class_name: 'User'
  belongs_to :courier, class_name: 'User'
  has_one :from_address, class_name: 'User', as: :addressable_from
  has_one :to_address, class_name: 'User', as: :addressable_to
end
