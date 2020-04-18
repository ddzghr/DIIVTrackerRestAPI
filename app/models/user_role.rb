class UserRole < ApplicationRecord
  has_uuid
  belongs_to :user
  belongs_to :role_type
end
