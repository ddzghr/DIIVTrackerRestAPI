class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  belongs_to :addressable_from, polymorphic: true
  belongs_to :addressable_to, polymorphic: true
  has_one :gps_location, as: :locatable
end
