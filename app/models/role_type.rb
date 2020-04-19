# frozen_string_literal: true

class RoleType < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  validates_presence_of :code, :name
  validates :internal_admin_type, inclusion: [true, false]
  validates :internal_application_type, inclusion: [true, false]
  validates :ordering_party_type, inclusion: [true, false]
  validates :courier_type, inclusion: [true, false]
  validates :supplier_type, inclusion: [true, false]
  validates :has_duration, inclusion: [true, false]
  validates :has_invoice, inclusion: [true, false]
end
