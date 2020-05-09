class Device < ApplicationRecord
  after_initialize :set_default_values, unless: :persisted?

  has_uuid
  has_secret_token
  belongs_to :user
  belongs_to :device_type
  has_secure_token :confirm_token
  has_secure_token :unlock_token
  has_secure_token :connection_token
  has_many :gps_locations, as: :locatable
  validates_presence_of :name,
                        :secret_token_digest
  validates_presence_of :secret_token_confirmation, if: -> { secret_token.present? }
  validates_confirmation_of :secret_token, if: -> { secret_token.present? }
  validates :device_active, inclusion: [true, false]
  validates :device_confirmed, inclusion: [true, false]
  validates :device_locked, inclusion: [true, false]

  private

  def set_default_values
    self.device_active = true
    self.device_confirmed = false
    self.device_locked = false
  end
end
