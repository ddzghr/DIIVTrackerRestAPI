class ApplicationRecord < ActiveRecord::Base
  require 'concerns/has_uuid'
  require 'concerns/has_secret_token'
  include Diiv::ActiveRecordHelper
  self.abstract_class = true
end
