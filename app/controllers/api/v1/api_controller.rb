# frozen_string_literal: true

class Api::V1::ApiController < ActionController::API
  def login!
    session[:user_id] = @user.id
  end

end
