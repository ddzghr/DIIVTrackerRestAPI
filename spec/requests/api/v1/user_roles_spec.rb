require 'rails_helper'

RSpec.describe "Api::V1::UserRoles", type: :request do
  describe "GET /api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/user-roles" do
    it "works! (now write some real specs)" do
      get clients_client_roles_path(client_uuid: 'eecb673c-9522-4ee6-a9f3-9231df396545')
      expect(response).to have_http_status(200)
    end
  end
end
