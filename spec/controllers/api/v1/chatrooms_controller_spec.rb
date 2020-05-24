# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ChatroomsController, type: :controller do
  let(:valid_attributes) do
    {
        name: 'Dublin Book Club',
        description: 'A group the discussion of modern literature and drama.',
        members: %w(test@example.com test2@example.com test3@example.com test4@example.com test5@example.com)
    }
  end

  let(:invalid_attributes) do
    {name: nil}
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Chatroom' do
        expect do
          post :create, params: {chatroom: valid_attributes}
        end.to change(Chatroom, :count).by(1)
      end

      it 'returns a 201 status code' do
        post :create, params: {chatroom: valid_attributes}
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Chatroom' do
        expect do
          post :create, params: {chatroom: invalid_attributes}
        end.to change(Chatroom, :count).by(0)
      end

      it 'returns a 422 status code' do
        post :create, params: {chatroom: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
            name: 'Dublin Music Club',
        }
      end

      it 'updates the requested Chatroom' do
        chatroom = create(:chatroom)
        put :update, params: {id: chatroom.to_param, chatroom: new_attributes}
        chatroom.reload
        expect(chatroom.attributes).to include('name' => 'Dublin Music Club')
      end

      it 'returns a 200 status code' do
        chatroom = create(:chatroom)

        put :update, params: {id: chatroom.to_param, chatroom: valid_attributes}
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'returns a 422 status code' do
        chatroom = create(:chatroom)

        put :update, params: {id: chatroom.to_param, chatroom: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested Chatroom' do
      chatroom = create(:chatroom)
      expect do
        delete :destroy, params: {id: chatroom.to_param}
      end.to change(Chatroom, :count).by(-1)
    end
  end
end
