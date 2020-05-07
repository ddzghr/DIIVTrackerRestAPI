require "rails_helper"

RSpec.describe Api::V1::DeliveriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/deliveries").to route_to("api/v1/deliveries#index", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/deliveries/0889a7e7-09a4-41c7-9c17-076ca0640e4c").to route_to("api/v1/deliveries#show", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :uuid => "0889a7e7-09a4-41c7-9c17-076ca0640e4c")
    end


    it "routes to #create" do
      expect(:post => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/deliveries").to route_to("api/v1/deliveries#create", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/deliveries/0889a7e7-09a4-41c7-9c17-076ca0640e4c").to route_to("api/v1/deliveries#update", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :uuid => "0889a7e7-09a4-41c7-9c17-076ca0640e4c")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/deliveries/0889a7e7-09a4-41c7-9c17-076ca0640e4c").to route_to("api/v1/deliveries#update", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :uuid => "0889a7e7-09a4-41c7-9c17-076ca0640e4c")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/deliveries/0889a7e7-09a4-41c7-9c17-076ca0640e4c").to route_to("api/v1/deliveries#destroy", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :uuid => "0889a7e7-09a4-41c7-9c17-076ca0640e4c")
    end
  end
end
