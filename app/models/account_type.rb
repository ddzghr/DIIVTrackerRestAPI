class AccountType < ApplicationRecord
  has_many :user_accounts
  has_many :users, through: :user_accounts

  validates_presence_of :code, :name, :internal_admin_type,
                        :internal_application_type, :ordering_party_type,
                        :courier_type, :supplier_type, :has_duration,
                        :has_invoice, :created_at, :updated_at
end
