# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:valid_attributes) do
    {
        email: 'valid_email@example.com',
        password: 'test_password',
        password_confirmation: 'test_password',
    }
  end

  let(:invalid_attributes) do
    {email: nil}
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect do
          post :create, params: {user: valid_attributes}
        end.to change(User, :count).by(1)
      end

      it 'returns a 201 status code' do
        post :create, params: {user: valid_attributes}
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'does not create a new User' do
        expect do
          post :create, params: {user: invalid_attributes}
        end.to change(User, :count).by(0)
      end

      it 'returns a 422 status code' do
        post :create, params: {user: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

end
