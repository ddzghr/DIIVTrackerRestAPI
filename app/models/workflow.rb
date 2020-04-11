class Workflow < ApplicationRecord
  belongs_to :new_status, class_name: 'Status'
  belongs_to :old_status, class_name: 'Status'
  belongs_to :device_type
end
