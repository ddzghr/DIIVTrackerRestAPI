class DeliveryStatus < ApplicationRecord
  belongs_to :delivery
  belongs_to :status
  belongs_to :device
  belongs_to :assigned_device, class_name: 'Device'
  has_one :destination,
          as: :addressable,
          dependent: :destroy,
          class_name: 'Address'
  has_many :gps_locations, as: :locatable
  has_one :contact, as: :contactable
end
