require "rails_helper"

RSpec.describe  Api::V1::WorkflowsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/v1/diiv/system/workflows").to route_to("api/v1/workflows#index")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/diiv/system/workflows/1").to route_to("api/v1/workflows#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/api/v1/diiv/system/workflows").to route_to("api/v1/workflows#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/diiv/system/workflows/1").to route_to("api/v1/workflows#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/diiv/system/workflows/1").to route_to("api/v1/workflows#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/diiv/system/workflows/1").to route_to("api/v1/workflows#destroy", :id => "1")
    end
  end
end
