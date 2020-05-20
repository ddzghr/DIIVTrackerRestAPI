class DeliveryAddress < ApplicationRecord
  belongs_to :address_type, inverse_of: :delivery_addresses, foreign_key: :address_types_id #, optional: true
  belongs_to :delivery, inverse_of: :delivery_addresses, foreign_key: :delivery_id #, optional: true
  has_one :address, as: :addressable
end
