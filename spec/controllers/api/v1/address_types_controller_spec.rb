# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::AddressTypesController, type: :controller do
  let(:valid_attributes) do
    {
      code: Faker::Lorem.characters[0..9].upcase,
      name: Faker::Lorem.words(number: 5).join(' ').capitalize
    }
  end

  let(:invalid_attributes) do
    {
      code: Faker::Lorem.characters[0..20].upcase,
      name: Faker::Lorem.words(number: 100).join(' ').capitalize
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AddressTypesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      address_type = AddressType.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      address_type = AddressType.create! valid_attributes
      get :show, params: { id: address_type.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new AddressType' do
        expect do
          post :create, params: { address_type: valid_attributes }, session: valid_session
        end.to change(AddressType, :count).by(1)
      end

      it 'renders a JSON response with the new address_type' do
        post :create, params: { address_type: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(address_type_url(AddressType.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new address_type' do
        post :create, params: { address_type: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          code: Faker::Lorem.characters[0..9].upcase,
          name: Faker::Lorem.words(number: 5).join(' ').capitalize
        }
      end

      it 'updates the requested address_type' do
        address_type = AddressType.create! valid_attributes
        put :update, params: { id: address_type.to_param, address_type: new_attributes }, session: valid_session
        address_type.reload
        expect(address_type.name).to eq new_attributes[:name]
        expect(address_type.code).to eq new_attributes[:code]
      end

      it 'renders a JSON response with the address_type' do
        address_type = AddressType.create! valid_attributes

        put :update, params: { id: address_type.to_param, address_type: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the address_type' do
        address_type = AddressType.create! valid_attributes

        put :update, params: { id: address_type.to_param, address_type: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested address_type' do
      address_type = AddressType.create! valid_attributes
      expect do
        delete :destroy, params: { id: address_type.to_param }, session: valid_session
      end.to change(AddressType, :count).by(-1)
    end
  end
end
