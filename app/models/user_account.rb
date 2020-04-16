class UserAccount < ApplicationRecord
  has_uuid
  belongs_to :user
  belongs_to :account_type
end
