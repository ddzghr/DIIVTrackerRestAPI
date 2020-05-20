class HellosController < ApplicationController
  skip_before_action :authorize_request, only: :index
  skip_authorization_check
  def index
    render json: 'Hello from DIIVTracker', status: :ok
  end
end
