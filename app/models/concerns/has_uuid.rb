# frozen_string_literal: true

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
      #     has_uuid :some_uuid_with_no_validation, validations: false
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
      def has_uuid(uuid_attribute = :uuid, options = {})
        # Load securerandom only when has_uuid is used. Lazy load
        require 'active_support/core_ext/securerandom'
        before_validation do
          if public_send('new_record?') && !send("#{uuid_attribute}?")
            send("#{uuid_attribute}=", self.class.generate_uuid(uuid_attribute, options))
          elsif public_send(uuid_attribute).downcase != public_send(uuid_attribute)
            send("#{uuid_attribute}=", public_send(uuid_attribute).downcase)
          end
        end
        if options.fetch(:validations, true)
          include ActiveModel::Validations
          validates uuid_attribute.to_s,
                    presence: :true,
                    length: { is: 36,
                              message: 'must be 36 characters long' },
                    format: { with: /\A[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}\z/,
                              message: 'is not properly formated' },
                    uniqueness: { case_sensitive: false,
                                  message: 'has already been taken' }
        end
      end

      def generate_uuid(attribute, options = {})
        loop do
          # generate uuid
          uuid = SecureRandom.uuid
          # check if uuid value is already stored in database
          break uuid unless options.fetch(:validations, true) && where("#{attribute}": uuid).exists?
        end
      end
    end
  end
end
