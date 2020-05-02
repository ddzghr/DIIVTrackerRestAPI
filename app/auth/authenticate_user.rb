# app/auth/authenticate_user.rb
class AuthenticateUser
  def initialize(host, uuid, password, new_password, new_password_confirmation)
    @host = host
    @uuid = uuid
    @password = password
    @new_password = new_password
    @new_password_confirmation = new_password_confirmation
  end

  # Service entry point
  def call
    if user
      JsonWebToken.encode({iss: @host,
                           aud: 'DIIVTrackerWeb',
                           sub: user.uuid,
                           prm: user.connection_token})
    end
  end

  private

  attr_reader :uuid, :password, :new_password, :new_password_confirmation

  # verify user credentials
  def user

    user = User.find_by_uuid(uuid)
    if user && user.authenticate(password)
      # check if password change is required
      if user.force_password_change? && (@new_password.blank? || @new_password_confirmation.blank?)
        raise(ExceptionHandler::MissingPasswordChange, Message.must_change_password)
      end
      # generate new connection token, multiple connections not allowed
      user.regenerate_connection_token
      # change password if needed
      unless @new_password.blank? && @new_password_confirmation.blank?
        user.update_attributes!(password: @new_password,
                                password_confirmation: @new_password_confirmation,
                                force_password_change: false)
      end
      # finally return user
      return user

    end
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
