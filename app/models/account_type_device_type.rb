class AccountTypeDeviceType < ApplicationRecord
  belongs_to :account_type
  belongs_to :device_type
end
