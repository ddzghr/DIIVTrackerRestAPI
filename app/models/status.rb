class Status < ApplicationRecord
  belongs_to :status
  has_many :workflows
  has_many :device_types, through: :workflows
end
