module Diiv
  module ActiveRecordHelper
    extend ActiveSupport::Concern

    module ClassMethods
      # Example using has_uuid
      #
      #   # Schema: User(uuid:string, some_uuid:string)
      #   class User < ActiveRecord::Base
      #     has_uuid
      #     has_uuid :some_uuid
      #   end
      #
      #   user = User.new
      #   user.save
      #   user.uuid # => "'ca9f9a40-dca7-462b-9da1-4b735faacc07'"
      #   user.some_uuid # => "98a73cf4-e521-45f0-914b-263f8d970889"
      #
      # SecureRandom::uuid is used to generate the random UUID, collisions are highly unlikely.
      #
      # Note that it's still possible to generate a race condition in the database in the same way that
      # <tt>validates_uniqueness_of</tt> can. You're encouraged to add a unique index in the database to deal
      # with this even more unlikely scenario.
      def has_uuid(attribute = :uuid)
        # Load securerandom only when has_uuid is used. Lazy load
        require 'active_support/core_ext/securerandom'
        before_validation { self.send("#{attribute}=", self.class.generate_uuid(attribute)) unless self.send("#{attribute}?")}
      end
      def generate_uuid(attribute)
        SecureRandom.uuid
        loop do
          # generate uuid
          token = SecureRandom.uuid
          # check if uuid value is already stored in database
          break token unless where("#{attribute}": token).exists?
        end
      end
    end
  end
end
