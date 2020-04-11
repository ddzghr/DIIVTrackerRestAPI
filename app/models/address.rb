class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  has_one :gps_location, as: :locatable
end
