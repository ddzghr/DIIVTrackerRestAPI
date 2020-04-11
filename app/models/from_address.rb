class FromAddress < ApplicationRecord
  belongs_to :delivery
  has_one :address, as: :addressable
end
