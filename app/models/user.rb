# frozen_string_literal: true
class User < ApplicationRecord
  has_secure_token :confirm_token
  has_secure_token :password_reset_token
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
                        :password_digest,
                        :confirm_token,
                        :password_reset_token
  validates :user_active, inclusion: [true, false]
  validates :user_locked, inclusion: [true, false]
  validates :email_confirmed, inclusion: [true, false]
end
