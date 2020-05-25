# frozen_string_literal: true

class Api::V1::SessionsController < Api::V1::ApiController

  def create
    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      login!
      render json: UserSerializer.new(@user).serializable_hash.to_json
    else
      render json: {errors: 'invalid credentials'}, status: :unauthorized
    end
  end

  def is_logged_in?
    if logged_in? && current_user
      render json: UserSerializer.new(current_user).serializable_hash.to_json
    else
      render json: {errors: 'invalid credentials'}, status: :unauthorized
    end
  end

  def destroy
    logout!
    render json: {logged_out: true}, status: :ok
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized_user?
    @user == current_user
  end

  def logout!
    session.clear
  end

end
