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

  def internal_api_server?
    internal_api_server_type?
  end

  def internal_web_server?
    internal_web_server_type?
  end

  def desktop?
    desktop_type?
  end

  def web_server?
    web_server_type?
  end

  def mobile?
    mobile_type?
  end

  def logout
    logout_me
  end

  private

  def set_default_values
    self.device_active ||= true
    self.device_confirmed ||= false
    self.device_locked ||= false
  end

  def internal_api_server_type?
    device_type.internal_api_server_type?
  end

  def internal_web_server_type?
    device_type.internal_web_server_type?
  end

  def desktop_type?
    device_type.desktop_type?
  end

  def web_server_type?
    device_type.web_server_type?
  end

  def mobile_type?
    device_type.mogile_type?
  end

  def logout_me
    regenerate_connection_token
  end

end
