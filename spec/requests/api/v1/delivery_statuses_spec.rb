require 'rails_helper'

RSpec.describe "Api::V1::DeliveryStatuses", type: :request do
  describe "GET /api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/deliveries/0889a7e7-09a4-41c7-9c17-076ca0640e4c/delivery-statuses" do
    it "works! (now write some real specs)" do
      get clients_client_delivery_delivery_statuses_path(client_uuid: 'eecb673c-9522-4ee6-a9f3-9231df396545', delivery_uuid: '0889a7e7-09a4-41c7-9c17-076ca0640e4c')
      expect(response).to have_http_status(200)
    end
  end
end
