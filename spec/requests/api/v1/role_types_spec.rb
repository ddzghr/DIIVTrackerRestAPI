require 'rails_helper'

RSpec.describe "Api::V1::RoleTypes", type: :request do
  describe "GET /api/v1/diiv/system/role_types" do
    it "works! (now write some real specs)" do
      get role_types_path
      expect(response).to have_http_status(200)
    end
  end
end
