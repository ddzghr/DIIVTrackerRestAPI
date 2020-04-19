require 'rails_helper'

RSpec.describe Api::V1::RoleTypesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # RoleType. As you add validations to RoleType, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      code: Faker::Lorem.characters[0..9].upcase,
      name: Faker::Lorem.words(number: 5).join(' ').capitalize,
      internal_admin_type: Faker::Boolean.boolean,
      internal_application_type: Faker::Boolean.boolean,
      ordering_party_type: Faker::Boolean.boolean,
      courier_type: Faker::Boolean.boolean,
      supplier_type: Faker::Boolean.boolean,
      has_duration: Faker::Boolean.boolean,
      has_invoice: Faker::Boolean.boolean
    }
  }

  let(:invalid_attributes) {
    {
      code: Faker::Lorem.characters[0..19].upcase,
      name: Faker::Lorem.words(number: 100).join(' ').capitalize,
      internal_admin_type: Faker::Boolean.boolean,
      internal_application_type: Faker::Boolean.boolean,
      ordering_party_type: Faker::Boolean.boolean,
      courier_type: Faker::Boolean.boolean,
      supplier_type: Faker::Boolean.boolean,
      has_duration: Faker::Boolean.boolean,
      has_invoice: Faker::Boolean.boolean
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RoleTypesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      role_type = RoleType.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      role_type = RoleType.create! valid_attributes
      get :show, params: {id: role_type.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new RoleType" do
        expect {
          post :create, params: {role_type: valid_attributes}, session: valid_session
        }.to change(RoleType, :count).by(1)
      end

      it "renders a JSON response with the new role_type" do

        post :create, params: {role_type: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(role_type_url(RoleType.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new role_type" do

        post :create, params: {role_type: invalid_attributes}, session: valid_session
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
          internal_admin_type: Faker::Boolean.boolean,
          internal_application_type: Faker::Boolean.boolean,
          ordering_party_type: Faker::Boolean.boolean,
          courier_type: Faker::Boolean.boolean,
          supplier_type: Faker::Boolean.boolean,
          has_duration: Faker::Boolean.boolean,
          has_invoice: Faker::Boolean.boolean
        }
      }

      it "updates the requested role_type" do
        role_type = RoleType.create! valid_attributes
        put :update, params: {id: role_type.to_param, role_type: new_attributes}, session: valid_session
        role_type.reload
        new_attributes.each_pair do |key, value|
          expect(role_type[key]).to eq(value),"expected #{key} to have value #{value} but got #{role_type[key]}"
        end
      end

      it "renders a JSON response with the role_type" do
        role_type = RoleType.create! valid_attributes

        put :update, params: {id: role_type.to_param, role_type: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the role_type" do
        role_type = RoleType.create! valid_attributes

        put :update, params: { id: role_type.to_param, role_type: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested role_type" do
      role_type = RoleType.create! valid_attributes
      expect {
        delete :destroy, params: { id: role_type.to_param }, session: valid_session
      }.to change(RoleType, :count).by(-1)
    end
  end

end
