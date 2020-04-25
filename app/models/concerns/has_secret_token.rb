module Diiv
  module ActiveRecordHelper
    extend ActiveSupport::Concern
    # BCrypt hash function can handle maximum 72 bytes, and if we pass
    # secret_token of length more than 72 bytes it ignores extra characters.
    # Hence need to put a restriction on secret_token length.
    MAX_SECRET_TOKEN_LENGTH_ALLOWED = 72

    class << self
      attr_accessor :min_cost # :nodoc:
    end
    self.min_cost = false

    module ClassMethods
      # Adds methods to set and authenticate against a BCrypt password.
      # This mechanism requires you to have a +secret_token_digest+ attribute.
      #
      # The following validations are added automatically:
      # * Password must be present on creation
      # * Password length should be less than or equal to 72 bytes
      #
      # For further customizability, it is possible to suppress the default
      # validations by passing <tt>validations: false</tt> as an argument.
      #
      # Add bcrypt (~> 3.1.7) to Gemfile to use #has_secret_token:
      #
      #   gem 'bcrypt', '~> 3.1.7'
      #
      # Example using Active Record (which automatically does not include Diiv::ActiveRecordHelper):
      #
      #   # Schema: User(name:string, secret_token_digest:string)
      #   class User < ActiveRecord::Base
      #     has_secret_token
      #   end
      #
      #   user = User.new(name: 'david', secret_token: '')
      #   user.save                                                       # => false, secret_token required
      #   user.secret_token = 'mUc3m00RsqyRe'
      #   user.save                                                       # => true
      #   user.authenticate('notright')                                   # => false
      #   user.authenticate('mUc3m00RsqyRe')                              # => user
      #   User.find_by(name: 'david').try(:authenticate, 'notright')      # => false
      #   User.find_by(name: 'david').try(:authenticate, 'mUc3m00RsqyRe') # => user
      def has_secret_token(options = {})
        # Load bcrypt gem only when has_secret_token is used.
        # This is to avoid ActiveModel (and by extension the entire framework)
        # being dependent on a binary library.
        begin
          require "bcrypt"
        rescue LoadError
          $stderr.puts "You don't have bcrypt installed in your application. Please add it to your Gemfile and run bundle install"
          raise
        end

        include InstanceMethodsOnActivation

        if options.fetch(:validations, true)
          include ActiveModel::Validations

          # This ensures the model has a secret_token by checking whether the secret_token_digest
          # is present, so that this works with both new and existing records. However,
          # when there is an error, the message is added to the secret_token attribute instead
          # so that the error message will make sense to the end-user.
          validate do |record|
            record.errors.add(:secret_token, :blank) unless record.secret_token_digest.present?
          end

          validates_length_of :secret_token, maximum: Diiv::ActiveRecordHelper::MAX_SECRET_TOKEN_LENGTH_ALLOWED
          validates_confirmation_of :secret_token, allow_blank: true
        end
      end
    end

    module InstanceMethodsOnActivation
      # Returns +self+ if the secret_token is correct, otherwise +false+.
      #
      #   class User < ActiveRecord::Base
      #     has_secret_token validations: false
      #   end
      #
      #   user = User.new(name: 'david', secret_token: 'mUc3m00RsqyRe')
      #   user.save
      #   user.authenticate('notright')      # => false
      #   user.authenticate('mUc3m00RsqyRe') # => user
      def authenticate(unencrypted_secret_token)
        BCrypt::Password.new(secret_token_digest).is_password?(unencrypted_secret_token) && self
      end

      attr_reader :secret_token

      # Encrypts the secret_token into the +secret_token_digest+ attribute, only if the
      # new secret_token is not empty.
      #
      #   class User < ActiveRecord::Base
      #     has_secret_token validations: false
      #   end
      #
      #   user = User.new
      #   user.secret_token = nil
      #   user.secret_token_digest # => nil
      #   user.secret_token = 'mUc3m00RsqyRe'
      #   user.secret_token_digest # => "$2a$10$4LEA7r4YmNHtvlAvHhsYAeZmk/xeUVtMTYqwIvYY76EW5GUqDiP4."
      def secret_token=(unencrypted_secret_token)
        if unencrypted_secret_token.nil?
          self.secret_token_digest = nil
        elsif !unencrypted_secret_token.empty?
          @secret_token = unencrypted_secret_token
          cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
          self.secret_token_digest = BCrypt::Password.create(unencrypted_secret_token, cost: cost)
        end
      end
    end
  end
end

