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
    l_user = user
    JsonWebToken.encode({iss: @host,
                         aud: 'DIIVTrackerClients',
                         sub: l_user.uuid,
                         prm: l_user.connection_token}) if l_user

  end

  private

  attr_reader :uuid, :password, :new_password, :new_password_confirmation

  # verify user credentials
  def user

    f_user = User.find_by_uuid(uuid)
    if f_user &&
       f_user.user_active? &&
       f_user.email_confirmed? &&
       !f_user.user_locked? &&
       f_user.authenticate(password)
      # check if password change is required
      if f_user.force_password_change? && (@new_password.blank? || @new_password_confirmation.blank?)
        raise(ExceptionHandler::MissingPasswordChange, Message.must_change_password)
      end
      # generate new connection token, multiple connections not allowed
      f_user.regenerate_connection_token
      # change password if needed
      unless @new_password.blank? && @new_password_confirmation.blank?
        f_user.update_attributes!(password: @new_password,
                                password_confirmation: @new_password_confirmation,
                                force_password_change: false)
      end
      # finally return f_user
      return f_user

    end
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
