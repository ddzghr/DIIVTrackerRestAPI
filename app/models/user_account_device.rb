class UserAccountDevice < ApplicationRecord
  belongs_to :user_account
  belongs_to :device
  belongs_to :account_type_device_type
end
