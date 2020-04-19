require "rails_helper"

RSpec.describe Api::V1::RoleTypeDeviceTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/v1/diiv/system/role-types-device-types").to route_to("api/v1/role_type_device_types#index")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/diiv/system/role-types-device-types/1").to route_to("api/v1/role_type_device_types#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/api/v1/diiv/system/role-types-device-types").to route_to("api/v1/role_type_device_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/diiv/system/role-types-device-types/1").to route_to("api/v1/role_type_device_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/diiv/system/role-types-device-types/1").to route_to("api/v1/role_type_device_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/diiv/system/role-types-device-types/1").to route_to("api/v1/role_type_device_types#destroy", :id => "1")
    end
  end
end
