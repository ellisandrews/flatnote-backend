class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]

    def create
        user = User.new(user_params)
        if user.save
            token = encode_token(user_id: user.id)
            render json: { user: UserSerializer.new(user), token: token }, status: :created
        else
            render json: { error: 'Failed to create user', messages: user.errors.full_messages }, status: :bad_request
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
