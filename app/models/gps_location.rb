class GpsLocation < ApplicationRecord
  belongs_to :locatable, polymorphic: true
end
