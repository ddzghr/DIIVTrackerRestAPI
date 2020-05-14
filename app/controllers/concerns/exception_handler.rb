# app/controllers/concerns/exception_handler.rb
module ExceptionHandler
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class MissingPasswordChange < StandardError; end

  included do

    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ActiveRecord::ValueTooLong, with: :four_twenty_two
    rescue_from CanCan::AuthorizationNotPerformed, with: :cancan_five_zero_zero
    rescue_from CanCan::AccessDenied, with: :unauthorized_request
    #rescue_from CanCan::AccessDenied, with: :not_found

    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
    rescue_from ExceptionHandler::MissingPasswordChange, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

  end

  private

  # JSON response with message; Status code 422 - unprocessable entity
  def four_twenty_two(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_request(e)
    json_response({ message: e.message }, :unauthorized)
  end

  # JSON response with message; Status code 404 - NotFound
  def not_found(e)
    head :not_found
  end

  # JSON response with message; Status code 500 - internal server error
  def five_zero_zero(e)
    json_response({ message: e.message }, :internal_server_error)
  end

  # JSON response with message; Status code 500 - internal server error
  def cancan_five_zero_zero(e)
    logger.error 'Start CanCanCan error'
    logger.error '  Message:    ' + e.message
    logger.error '  Class:      ' + self.class.name
    logger.error '  Parameters: ' + request.parameters.to_s
    logger.error 'End'
    self.response_body = nil
    @_response_body = nil
    json_response("We are sorry. Your request cannot be fulfilled at this time. Please try later.", :internal_server_error)
  end

end
