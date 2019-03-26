class UsersController < ApplicationController
  # before_action :authorized, except: [:index, :show, :create]

  def create
    @user = User.new(user_params)
    if @user.save
      token = JWT.encode(userId: @user.id)
      render json: { username: @user.username, token: token }, status: :created
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
