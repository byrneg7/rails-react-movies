# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::ApiController

  def index
    @users = User.all
    if @users
      render json: UserSerializer.new(@users).serializable_hash.to_json
    else
      render json: {status: 500, errors: ['no users found']}
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: UserSerializer.new(@user).serializable_hash.to_json
    else
      render json: { status: 500, errors: ['user not found'] }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!
      render json: UserSerializer.new(@user).serializable_hash.to_json, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
