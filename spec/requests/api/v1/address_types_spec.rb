require 'rails_helper'

RSpec.describe "Api::V1::AddressTypes", type: :request do
  describe "GET /api/v1/diiv/system/address-types" do
    it "works! (now write some real specs)" do
      get address_types_path
      expect(response).to have_http_status(200)
    end
  end
end
