require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /api/v1/diiv/system/users" do
    it "works! (now write some real specs)" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end
end
