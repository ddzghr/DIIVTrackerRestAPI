class ToAddress < ApplicationRecord
  belongs_to :delivery
  has_one :address, as: :addressable
end
