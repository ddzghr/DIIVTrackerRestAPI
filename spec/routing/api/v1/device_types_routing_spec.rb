require "rails_helper"

RSpec.describe Api::V1::DeviceTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/v1/diiv/system/device-types").to route_to("api/v1/device_types#index")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/diiv/system/device-types/1").to route_to("api/v1/device_types#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/api/v1/diiv/admins/eecb673c-9522-4ee6-a9f3-9231df396545/device-types").to route_to("api/v1/device_types#create", :admin_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/diiv/admins/eecb673c-9522-4ee6-a9f3-9231df396545/device-types/1").to route_to("api/v1/device_types#update", :admin_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/diiv/admins/eecb673c-9522-4ee6-a9f3-9231df396545/device-types/1").to route_to("api/v1/device_types#update", :admin_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/diiv/admins/eecb673c-9522-4ee6-a9f3-9231df396545/device-types/1").to route_to("api/v1/device_types#destroy", :admin_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :id => "1")
    end
  end
end
