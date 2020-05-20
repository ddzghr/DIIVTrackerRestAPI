# frozen_string_literal: true
class User < ApplicationRecord
  after_initialize :set_default_values, unless: :persisted?

  has_secure_token :confirm_token
  has_secure_token :password_reset_token
  has_secure_token :connection_token
  has_secure_password
  has_uuid
  has_one :address, as: :addressable
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :ordered_deliveries,
           class_name: 'Delivery',
           foreign_key: 'orderer_id'
  has_many :supplied_deliveries,
           class_name: 'Delivery',
           foreign_key: 'supplier_id'
  has_many :couriered_deliveries,
           class_name: 'Delivery',
           foreign_key: 'courier_id'

  validates_presence_of :name,
                        :email,
                        :password_digest
  validates_presence_of :password_confirmation, if: -> { password.present? }
  validates_confirmation_of :password, if: -> { password.present? }
  validates :user_active, inclusion: [true, false]
  validates :user_locked, inclusion: [true, false]
  validates :email_confirmed, inclusion: [true, false]

  def admin?
    admin_role?
  end

  def application?
    application_role?
  end

  def orderer?
    orderer_role?
  end

  def courier?
    courier_role?
  end

  def supplier?
    supplier_role?
  end

  def logout
    logout_me
  end

  private

  def set_default_values
    self.user_active = true if user_active.nil?
    self.user_locked = false if user_locked.nil?
    self.email_confirmed = false if email_confirmed.nil?
    self.force_password_change = false if force_password_change.nil?
  end

  def admin_role?
    return true if roles.find_by internal_admin_type: true

    false
  end

  def application_role?
    return true if roles.find_by internal_application_type: true

    false
  end

  def orderer_role?
    return true if roles.find_by ordering_party_type: true

    false
  end

  def courier_role?
    return true if roles.find_by courier_type: true

    false
  end

  def supplier_role?
    return true if roles.find_by supplier_type: true

    false
  end

  def logout_me
    regenerate_connection_token
  end

end
