# app/auth/authorize_client_api_request.rb
class AuthorizeClientApiRequest
  def initialize(uuid, headers = {})
    @uuid = uuid
    @headers = headers
  end

  # Service entry point - return valid user object
  def call
    {
      user: user
    }
  end

  private

  attr_reader :headers
  attr_reader :uuid

  def user
    # check if user is in the database
    # check if token matches user
    # memoize user object
    client = User.find_by_uuid(:uuid)
    if client &&
       decoded_auth_token &&
       (client.uuid = decoded_auth_token[:sub]) &&
       (client.connection_token = decoded_auth_token[:prm])
      @user ||= client
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
