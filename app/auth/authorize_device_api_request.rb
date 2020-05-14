# app/auth/authorize_device_api_request.rb
class AuthorizeDeviceApiRequest
  def initialize(uuid, headers = {})
    @uuid = uuid
    @headers = headers
  end

  # Service entry point - return valid user object
  def call
    {
      device: device
    }
  end

  private

  attr_reader :headers
  attr_reader :uuid

  def device
    # check if device is in the database
    # check if token matches device
    # memorize device object
    f_device = Device.find_by_uuid(uuid)
    if f_device &&
       f_device.device_active? &&
       f_device.device_confirmed? &&
       f_device.user.user_active? &&
       f_device.user.email_confirmed? &&
       !f_device.user.user_locked? &&
       decoded_auth_token &&
       f_device.uuid == decoded_auth_token[:sub] &&
       f_device.connection_token == decoded_auth_token[:prm] &&
       Time.now.to_i.between?(decoded_auth_token[:iat], decoded_auth_token[:exp])
      @device ||= f_device
    else
      raise(ExceptionHandler::InvalidToken, Message.unauthorized)
    end
    
  # handle user not found
  rescue ActiveRecord::RecordNotFound => e
    # raise custom error
    raise(
      ExceptionHandler::InvalidToken, ("#{Message.invalid_token} #{e.message}")
    )
  end

  # decode authentication token
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  # check for token in `Authorization` header
  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end

    raise(ExceptionHandler::MissingToken, Message.missing_token)
  end
end
