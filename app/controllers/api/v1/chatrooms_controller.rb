# frozen_string_literal: true

class Api::V1::ChatroomsController < Api::V1::ApiController
  before_action :set_chatroom, only: %i[show update destroy]

  def index
    @chatrooms = ChatroomSerializer.new(Chatroom.all).serializable_hash.to_json

    render json: @chatrooms
  end

  def show
    render json: ChatroomSerializer.new(@chatroom).serializable_hash.to_json
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      render json: ChatroomSerializer.new(@chatroom).serializable_hash.to_json, status: :created
    else
      render json: @chatroom.errors, status: :unprocessable_entity
    end
  end

  def update
    if @chatroom.update(chatroom_params)
      render json: ChatroomSerializer.new(@chatroom).serializable_hash.to_json, status: :ok
    else
      render json: @chatroom.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @chatroom.destroy
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:name, :description, :members, members: [])
  end
end
