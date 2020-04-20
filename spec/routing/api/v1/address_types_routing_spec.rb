require "rails_helper"

RSpec.describe Api::V1::AddressTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/v1/diiv/system/address-types").to route_to("api/v1/address_types#index")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/diiv/system/address-types/1").to route_to("api/v1/address_types#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/api/v1/diiv/system/address-types").to route_to("api/v1/address_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/diiv/system/address-types/1").to route_to("api/v1/address_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/diiv/system/address-types/1").to route_to("api/v1/address_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/diiv/system/address-types/1").to route_to("api/v1/address_types#destroy", :id => "1")
    end
  end
end