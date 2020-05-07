require "rails_helper"

RSpec.describe Api::V1::DevicesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/devices").to route_to("api/v1/devices#index", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/devices/bf58d1d1-f071-40db-891f-28520757bca6").to route_to("api/v1/devices#show", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :uuid => "bf58d1d1-f071-40db-891f-28520757bca6")
    end


    it "routes to #create" do
      expect(:post => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/devices").to route_to("api/v1/devices#create", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/devices/bf58d1d1-f071-40db-891f-28520757bca6").to route_to("api/v1/devices#update", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :uuid => "bf58d1d1-f071-40db-891f-28520757bca6")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/devices/bf58d1d1-f071-40db-891f-28520757bca6").to route_to("api/v1/devices#update", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :uuid => "bf58d1d1-f071-40db-891f-28520757bca6")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/devices/bf58d1d1-f071-40db-891f-28520757bca6").to route_to("api/v1/devices#destroy", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :uuid => "bf58d1d1-f071-40db-891f-28520757bca6")
    end
  end
end
