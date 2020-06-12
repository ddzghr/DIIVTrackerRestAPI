class HellosController < ApplicationController
  skip_before_action :authorize_request, only: :index
  skip_authorization_check
  def index
    json_response(json_message('message', 'Hello from DIIVTracker'), :ok)
  end
end
