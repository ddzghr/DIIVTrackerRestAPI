require 'rails_helper'

RSpec.describe Api::V1::DeviceTypesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # DeviceType. As you add validations to DeviceType, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      code: Faker::Lorem.characters[0..9].upcase,
      name: Faker::Lorem.words(number: 5).join(' ').capitalize,
      internal_api_server_type: Faker::Boolean.boolean,
      internal_web_server_type: Faker::Boolean.boolean,
      desktop_type: Faker::Boolean.boolean,
      web_server_type: Faker::Boolean.boolean,
      mobile_type: Faker::Boolean.boolean
    }
  }

  let(:invalid_attributes) {
    {
      code: Faker::Lorem.characters[0..19].upcase,
      name: Faker::Lorem.words(number: 100).join(' ').capitalize,
      internal_api_server_type: nil,
      internal_web_server_type: nil,
      desktop_type: nil,
      web_server_type: nil,
      mobile_type: nil
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DeviceTypesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      device_type = DeviceType.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      device_type = DeviceType.create! valid_attributes
      get :show, params: {id: device_type.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new DeviceType" do
        expect {
          post :create, params: {device_type: valid_attributes}, session: valid_session
        }.to change(DeviceType, :count).by(1)
      end

      it "renders a JSON response with the new device_type" do

        post :create, params: {device_type: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(device_type_url(DeviceType.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new device_type" do

        post :create, params: {device_type: invalid_attributes}, session: valid_session
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
          name: Faker::Lorem.words(number: 5).join(' ').capitalize,
          internal_api_server_type: Faker::Boolean.boolean,
          internal_web_server_type: Faker::Boolean.boolean,
          desktop_type: Faker::Boolean.boolean,
          web_server_type: Faker::Boolean.boolean,
          mobile_type: Faker::Boolean.boolean
        }
      }

      it "updates the requested device_type" do
        device_type = DeviceType.create! valid_attributes
        put :update, params: {id: device_type.to_param, device_type: new_attributes}, session: valid_session
        device_type.reload
        new_attributes.each_pair do |key, value|
          expect(device_type[key]).to eq(value),"expected #{key} to have value #{value} but got #{device_type[key]}"
        end
      end

      it "renders a JSON response with the device_type" do
        device_type = DeviceType.create! valid_attributes

        put :update, params: {id: device_type.to_param, device_type: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the device_type" do
        device_type = DeviceType.create! valid_attributes

        put :update, params: {id: device_type.to_param, device_type: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested device_type" do
      device_type = DeviceType.create! valid_attributes
      expect {
        delete :destroy, params: {id: device_type.to_param}, session: valid_session
      }.to change(DeviceType, :count).by(-1)
    end
  end

end
