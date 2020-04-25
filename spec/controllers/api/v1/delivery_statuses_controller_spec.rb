require 'rails_helper'

RSpec.describe Api::V1::DeliveryStatusesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # DeliveryStatus. As you add validations to DeliveryStatus, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DeliveryStatusesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      delivery_status = DeliveryStatus.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      delivery_status = DeliveryStatus.create! valid_attributes
      get :show, params: {id: delivery_status.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new DeliveryStatus" do
        expect {
          post :create, params: {delivery_status: valid_attributes}, session: valid_session
        }.to change(DeliveryStatus, :count).by(1)
      end

      it "renders a JSON response with the new delivery_status" do

        post :create, params: {delivery_status: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(delivery_status_url(DeliveryStatus.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new delivery_status" do

        post :create, params: {delivery_status: invalid_attributes}, session: valid_session
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

      it "updates the requested delivery_status" do
        delivery_status = DeliveryStatus.create! valid_attributes
        put :update, params: {id: delivery_status.to_param, delivery_status: new_attributes}, session: valid_session
        delivery_status.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the delivery_status" do
        delivery_status = DeliveryStatus.create! valid_attributes

        put :update, params: {id: delivery_status.to_param, delivery_status: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the delivery_status" do
        delivery_status = DeliveryStatus.create! valid_attributes

        put :update, params: {id: delivery_status.to_param, delivery_status: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested delivery_status" do
      delivery_status = DeliveryStatus.create! valid_attributes
      expect {
        delete :destroy, params: {id: delivery_status.to_param}, session: valid_session
      }.to change(DeliveryStatus, :count).by(-1)
    end
  end

end
