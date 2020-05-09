# app/auth/authenticate_device.rb
class AuthenticateDevice
  def initialize(host, uuid, secret_token)
    @host = host
    @uuid = uuid
    @secret_token = secret_token
  end

  # Service entry point
  def call
    l_device = device
    JsonWebToken.encode({iss: @host,
                         aud: 'DIIVTrackerApps',
                         sub: l_device.uuid,
                         prm: l_device.connection_token}) if l_device
  end

  private

  attr_reader :uuid, :secret_token

  # verify device credentials
  def device

    f_device = Device.find_by_uuid(uuid)
    if f_device &&
       f_device.device_active? &&
       f_device.device_confirmed? &&
       !f_device.device_locked? &&
       f_device.user.user_active? &&
       f_device.user.email_confirmed? &&
       !f_device.user.user_locked? &&
       f_device.authenticate(secret_token)
      # generate new connection token, multiple connections not allowed
      f_device.regenerate_connection_token
      # finally return device
      return f_device

    end
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
