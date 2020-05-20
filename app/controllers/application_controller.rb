class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  attr_reader :current_user
  attr_reader :current_device
  # called before every action on controllers
  before_action :make_action_mailer_use_request_host_and_protocol
  before_action :authorize_request
  # check_authorization

  private

  # prepare mailer
  def make_action_mailer_use_request_host_and_protocol
    ActionMailer::Base.default_url_options[:protocol] = request.protocol
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  # Check for valid request token and return user
  def authorize_request
    if request.path_info.include?('clients')
      @current_user = AuthorizeClientApiRequest.new(request.parameters[:client_uuid], request.headers).call[:user]
    elsif request.path_info.include?('apps')
      @current_device = AuthorizeDeviceApiRequest.new(request.parameters[:device_uuid], request.headers).call[:device]
      @current_user = @current_device.user unless @current_device.nil?
    else
      raise(ExceptionHandler::AuthenticationError, Message.unauthorized)
    end
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, current_device)
  end

end
