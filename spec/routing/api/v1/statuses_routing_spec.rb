require "rails_helper"

RSpec.describe Api::V1::StatusesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/v1/diiv/system/statuses").to route_to("api/v1/statuses#index")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/diiv/system/statuses/1").to route_to("api/v1/statuses#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/api/v1/diiv/system/statuses").to route_to("api/v1/statuses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/diiv/system/statuses/1").to route_to("api/v1/statuses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/diiv/system/statuses/1").to route_to("api/v1/statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/diiv/system/statuses/1").to route_to("api/v1/statuses#destroy", :id => "1")
    end
  end
end
