class ApplicationRecord < ActiveRecord::Base
  require 'concerns/has_uuid'
  include Diiv::ActiveRecordHelper
  self.abstract_class = true
end
