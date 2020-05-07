require "rails_helper"

RSpec.describe Api::V1::RoleDeviceTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/v1/apps/eecb673c-9522-4ee6-a9f3-9231df396545/roles-device-types").to route_to("api/v1/role_device_types#index", :device_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/apps/eecb673c-9522-4ee6-a9f3-9231df396545/roles-device-types/1").to route_to("api/v1/role_device_types#show", :device_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :id => "1")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/roles-device-types/1").to route_to("api/v1/role_device_types#show", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/roles-device-types").to route_to("api/v1/role_device_types#create", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/roles-device-types/1").to route_to("api/v1/role_device_types#update", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/roles-device-types/1").to route_to("api/v1/role_device_types#update", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/roles-device-types/1").to route_to("api/v1/role_device_types#destroy", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :id => "1")
    end
  end
end
