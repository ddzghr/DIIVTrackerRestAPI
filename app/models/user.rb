# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_token :confirm_token
  has_secure_token :password_reset_token
  has_secure_password
  has_one :address, as: :addressable
  has_many :user_accounts
  has_many :account_types, through: :user_accounts
  has_many :ordered_deliveries,
           class_name: 'Delivery',
           foreign_key: 'orderer_id'
  has_many :supplied_deliveries,
           class_name: 'Delivery',
           foreign_key: 'supplier_id'
  has_many :couriered_deliveries,
           class_name: 'Delivery',
           foreign_key: 'courier_id'
end
