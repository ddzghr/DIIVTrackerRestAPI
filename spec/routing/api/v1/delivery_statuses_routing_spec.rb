require "rails_helper"

RSpec.describe Api::V1::DeliveryStatusesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/deliveries/0889a7e7-09a4-41c7-9c17-076ca0640e4c/delivery-statuses").to route_to("api/v1/delivery_statuses#index", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", delivery_uuid: "0889a7e7-09a4-41c7-9c17-076ca0640e4c")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/deliveries/0889a7e7-09a4-41c7-9c17-076ca0640e4c/delivery-statuses/1").to route_to("api/v1/delivery_statuses#show", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", delivery_uuid: "0889a7e7-09a4-41c7-9c17-076ca0640e4c", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/deliveries/0889a7e7-09a4-41c7-9c17-076ca0640e4c/delivery-statuses").to route_to("api/v1/delivery_statuses#create", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", delivery_uuid: "0889a7e7-09a4-41c7-9c17-076ca0640e4c")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/deliveries/0889a7e7-09a4-41c7-9c17-076ca0640e4c/delivery-statuses/1").to route_to("api/v1/delivery_statuses#update", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", delivery_uuid: "0889a7e7-09a4-41c7-9c17-076ca0640e4c", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/deliveries/0889a7e7-09a4-41c7-9c17-076ca0640e4c/delivery-statuses/1").to route_to("api/v1/delivery_statuses#update", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", delivery_uuid: "0889a7e7-09a4-41c7-9c17-076ca0640e4c", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/deliveries/0889a7e7-09a4-41c7-9c17-076ca0640e4c/delivery-statuses/1").to route_to("api/v1/delivery_statuses#destroy", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", delivery_uuid: "0889a7e7-09a4-41c7-9c17-076ca0640e4c", :id => "1")
    end
  end
end
