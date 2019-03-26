class AuthController < ApplicationController
    # skip_before_action :authorized, only: [:create]

    def create
      @user = User.find_by(username: user_login_params[:username])
      if @user && @user.authenticate(user_login_params[:password])
        token = JWT.encode({ userId: @user.id }, ENV['SECRET'])
        render json: { user: @user.username, token: token, userId: @user.id }, status: :accepted
      else
        render json: { error: 'Nope' }, status: :unauthorized
      end
    end


    private

    def user_login_params
      params.permit(:username, :password)
    end
end
