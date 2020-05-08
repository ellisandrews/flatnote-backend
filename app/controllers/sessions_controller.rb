class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      token = encode_token(user_id: user.id)
      render json: { user: UserSerializer.new(user), token: token }, status: :created
    else
      render json: { error: 'Failed to authenticate' }, status: :forbidden
    end
  end

  def show
    if @user
      render json: @user
    else
      render json: { error: 'Invalid token' }, status: :forbidden
    end
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end

end
