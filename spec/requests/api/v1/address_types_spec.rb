require 'rails_helper'

RSpec.describe "Api::V1::AddressTypes", type: :request do
  describe "GET /api/v1/apps/eecb673c-9522-4ee6-a9f3-9231df396545/address-types" do
    it "works! (now write some real specs)" do
      get apps_device_address_types_path(device_uuid: 'eecb673c-9522-4ee6-a9f3-9231df396545')
      expect(response).to have_http_status(200)
    end
  end
end
