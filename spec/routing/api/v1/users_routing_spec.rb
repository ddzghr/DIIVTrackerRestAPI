require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/diiv/system/users").to route_to("api/v1/users#index")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/diiv/system/users/1").to route_to("api/v1/users#show", :uuid => "1")
    end

    it "routes to #index" do
      expect(:get => "/api/v1/diiv/admins/eecb673c-9522-4ee6-a9f3-9231df396545/users").to route_to("api/v1/users#index", :admin_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/diiv/admins/eecb673c-9522-4ee6-a9f3-9231df396545/users/1").to route_to("api/v1/users#show", :admin_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :uuid => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/v1/diiv/admins/eecb673c-9522-4ee6-a9f3-9231df396545/users").to route_to("api/v1/users#create", :admin_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/diiv/admins/eecb673c-9522-4ee6-a9f3-9231df396545/users/1").to route_to("api/v1/users#update", :uuid => "1", :admin_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/diiv/admins/eecb673c-9522-4ee6-a9f3-9231df396545/users/1").to route_to("api/v1/users#update", :uuid => "1", :admin_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/diiv/admins/eecb673c-9522-4ee6-a9f3-9231df396545/users/1").to route_to("api/v1/users#destroy", :admin_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :uuid => "1")
    end
  end
end
