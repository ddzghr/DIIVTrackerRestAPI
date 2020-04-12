class DeliveryAddress < ApplicationRecord
  belongs_to :address_type
  belongs_to :delivery
  has_one :address, as: :addressable
end
