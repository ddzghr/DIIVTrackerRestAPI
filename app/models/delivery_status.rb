class DeliveryStatus < ApplicationRecord
  belongs_to :delivery
  belongs_to :status
  belongs_to :device
  belongs_to :assigned_device, class_name: 'Device', optional: true
  has_one :destination,
          as: :addressable,
          dependent: :destroy,
          class_name: 'Address'
  has_many :gps_locations, as: :locatable
  has_one :last_location, -> { order('id DESC').limit(1) },
          class_name: 'GpsLocation', as: :locatable
  has_one :contact, as: :contactable, required: false
end
