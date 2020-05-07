require 'rails_helper'

RSpec.describe Api::V1::StatusesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Status. As you add validations to Status, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      code: Faker::Lorem.characters[0..9].upcase,
      name: Faker::Lorem.words(number: 3).join(' ').capitalize,
      new_type_status: Faker::Boolean.boolean,
      in_progress_type_status: Faker::Boolean.boolean,
      stored_type_status: Faker::Boolean.boolean,
      delivered_type_status: Faker::Boolean.boolean,
      status_id: nil
    }
  }

  let(:invalid_attributes) {
    {
      code: Faker::Lorem.characters[0..19].upcase,
      name: Faker::Lorem.words(number: 100).join(' ').capitalize,
      new_type_status: nil,
      in_progress_type_status: nil,
      stored_type_status: nil,
      delivered_type_status: nil,
      status_id: 'nil'
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StatusesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      status = Status.create! valid_attributes
      get :index, params: { use_route: '/api/v1/clients/:client_uuid/statuses' }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      status = Status.create! valid_attributes
      get :show, params: { use_route: '/api/v1/clients/:client_uuid/statuses', id: status.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Status" do
        expect {
          post :create, params: { use_route: '/api/v1/clients/:client_uuid/statuses', status: valid_attributes }, session: valid_session
        }.to change(Status, :count).by(1)
      end

      it "renders a JSON response with the new status" do

        post :create, params: { use_route: '/api/v1/clients/:client_uuid/statuses', status: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        # expect(response.location).to eq(status_url(Status.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new status" do

        post :create, params: { use_route: '/api/v1/clients/:client_uuid/statuses', status: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          code: Faker::Lorem.characters[0..9].upcase,
          name: Faker::Lorem.words(number: 3).join(' ').capitalize,
          new_type_status: Faker::Boolean.boolean,
          in_progress_type_status: Faker::Boolean.boolean,
          stored_type_status: Faker::Boolean.boolean,
          delivered_type_status: Faker::Boolean.boolean,
          status_id: nil
        }
      }

      it "updates the requested status" do
        status = Status.create! valid_attributes
        put :update, params: { use_route: '/api/v1/clients/:client_uuid/statuses', id: status.to_param, status: new_attributes }, session: valid_session
        status.reload
        new_attributes.each_pair do |key, value|
          expect(status[key]).to eq(value),"expected #{key} to have value #{value} but got #{status[key]}"
        end
      end

      it "renders a JSON response with the status" do
        status = Status.create! valid_attributes

        put :update, params: { use_route: '/api/v1/clients/:client_uuid/statuses', id: status.to_param, status: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the status" do
        status = Status.create! valid_attributes

        put :update, params: { use_route: '/api/v1/clients/:client_uuid/statuses', id: status.to_param, status: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested status" do
      status = Status.create! valid_attributes
      expect {
        delete :destroy, params: { use_route: '/api/v1/clients/:client_uuid/statuses', id: status.to_param }, session: valid_session
      }.to change(Status, :count).by(-1)
    end
  end

end
