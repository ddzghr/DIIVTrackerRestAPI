require 'rails_helper'

RSpec.describe "Api::V1::Devices", type: :request do
  describe "GET /api/v1/diiv/clients/eecb673c-9522-4ee6-a9f3-9231df396545/devices" do
    it "works! (now write some real specs)" do
      get clients_client_devices_path(client_uuid: 'eecb673c-9522-4ee6-a9f3-9231df396545')
      expect(response).to have_http_status(200)
    end
  end
end
