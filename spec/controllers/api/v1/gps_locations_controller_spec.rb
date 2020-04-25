require 'rails_helper'

RSpec.describe Api::V1::GpsLocationsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # GpsLocation. As you add validations to GpsLocation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GpsLocationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      gps_location = GpsLocation.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      gps_location = GpsLocation.create! valid_attributes
      get :show, params: {id: gps_location.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new GpsLocation" do
        expect {
          post :create, params: {gps_location: valid_attributes}, session: valid_session
        }.to change(GpsLocation, :count).by(1)
      end

      it "renders a JSON response with the new gps_location" do

        post :create, params: {gps_location: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(gps_location_url(GpsLocation.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new gps_location" do

        post :create, params: {gps_location: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested gps_location" do
        gps_location = GpsLocation.create! valid_attributes
        put :update, params: {id: gps_location.to_param, gps_location: new_attributes}, session: valid_session
        gps_location.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the gps_location" do
        gps_location = GpsLocation.create! valid_attributes

        put :update, params: {id: gps_location.to_param, gps_location: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the gps_location" do
        gps_location = GpsLocation.create! valid_attributes

        put :update, params: {id: gps_location.to_param, gps_location: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested gps_location" do
      gps_location = GpsLocation.create! valid_attributes
      expect {
        delete :destroy, params: {id: gps_location.to_param}, session: valid_session
      }.to change(GpsLocation, :count).by(-1)
    end
  end

end
