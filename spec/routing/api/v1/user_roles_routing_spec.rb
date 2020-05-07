require "rails_helper"

RSpec.describe Api::V1::UserRolesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/users/ffcb673c-9999-4ee6-a9f3-9231df396545/user-roles").to route_to("api/v1/user_roles#index", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :user_uuid => "ffcb673c-9999-4ee6-a9f3-9231df396545")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/users/ffcb673c-9999-4ee6-a9f3-9231df396545/user-roles/1").to route_to("api/v1/user_roles#show", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :user_uuid => "ffcb673c-9999-4ee6-a9f3-9231df396545", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/users/ffcb673c-9999-4ee6-a9f3-9231df396545/user-roles").to route_to("api/v1/user_roles#create", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :user_uuid => "ffcb673c-9999-4ee6-a9f3-9231df396545")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/users/ffcb673c-9999-4ee6-a9f3-9231df396545/user-roles/1").to route_to("api/v1/user_roles#update", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :user_uuid => "ffcb673c-9999-4ee6-a9f3-9231df396545", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/users/ffcb673c-9999-4ee6-a9f3-9231df396545/user-roles/1").to route_to("api/v1/user_roles#update", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :user_uuid => "ffcb673c-9999-4ee6-a9f3-9231df396545", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/clients/eecb673c-9522-4ee6-a9f3-9231df396545/users/ffcb673c-9999-4ee6-a9f3-9231df396545/user-roles/1").to route_to("api/v1/user_roles#destroy", :client_uuid =>"eecb673c-9522-4ee6-a9f3-9231df396545", :user_uuid => "ffcb673c-9999-4ee6-a9f3-9231df396545", :id => "1")
    end
  end
end
