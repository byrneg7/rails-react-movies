# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do

  let!(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) { FactoryBot.attributes_for(:user) }

  let(:invalid_email) do
    {email: nil}
  end

  let(:invalid_password) do
    {password: nil}
  end

  describe 'POST /login' do
    context 'with valid params' do
      it 'logs a user in' do
        post :create, params: {user: valid_attributes}
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid params' do
      it 'does not log a user in' do
        post :create, params: {user: invalid_email}
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with invalid params' do
      it 'does not log a user in' do
        post :create, params: {user: invalid_password}
        expect(response).to have_http_status(:unauthorized)
      end
    end

  end
end
