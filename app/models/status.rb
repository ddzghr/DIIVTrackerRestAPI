class Status < ApplicationRecord
  belongs_to :status, optional: true
  has_many :workflows
  has_many :device_types, through: :workflows
end
