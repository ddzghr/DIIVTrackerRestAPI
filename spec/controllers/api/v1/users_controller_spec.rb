require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:pass){ Faker::Internet.password }

  let(:valid_attributes) {
    {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: :pass,
      password_confirmation: :pass,
      company_name: Faker::Company.name
    }
  }

  let(:invalid_attributes) {
    {
      name: Faker::Lorem.words(number: 100).join(' ').capitalize,
      email: Faker::Lorem.words(number: 3).join(' ').capitalize,
      password: Faker::Lorem.words(number: 3).join(' ').capitalize,
      company_name: Faker::Lorem.words(number: 100).join(' ').capitalize
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      user = User.create! valid_attributes
      get :index, params: { use_route: '/api/v1/clients/:client_uuid/users' }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user = User.create! valid_attributes
      get :show, params: { use_route: '/api/v1/clients/:client_uuid/users', uuid: user.uuid.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: { use_route: '/api/v1/clients/:client_uuid/users', user: valid_attributes }, session: valid_session
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do

        post :create, params: { user: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        # expect(response.location).to eq(user_url(User.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new user" do

        post :create, params: { use_route: '/api/v1/clients/:client_uuid/users', user: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: Faker::Name.name,
          email: Faker::Internet.email,
          password: :pass,
          password_confirmation: :pass,
          company_name: Faker::Company.name
        }
      }

      it "updates the requested user" do
        user = User.create! valid_attributes
        put :update, params: { use_route: '/api/v1/clients/:client_uuid/users', uuid: user.uuid.to_param, user: new_attributes }, session: valid_session
        user.reload
        new_attributes.except(:password, :password_confirmation).each_pair do |key, value|
          expect(user[key]).to eq(value),"expected #{key} to have value #{value} but got #{user[key]}"
        end
      end

      it "renders a JSON response with the user" do
        user = User.create! valid_attributes

        put :update, params: { use_route: '/api/v1/clients/:client_uuid/users', uuid: user.uuid.to_param, user: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the user" do
        user = User.create! valid_attributes

        put :update, params: { use_route: '/api/v1/clients/:client_uuid/users', uuid: user.uuid.to_param, user: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, params: { use_route: '/api/v1/clients/:client_uuid/users', uuid: user.uuid.to_param }, session: valid_session
      }.to change(User, :count).by(-1)
    end
  end

end
