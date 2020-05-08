class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]

    # NOTE: Commented out actions are currently only necessary for development or admin purposes, so leaving out.

    # def index
    #     users = User.all.order(:id)
    #     render json: users
    # end

    # def show
    #     user = User.find_by(id: params[:id])
    #     if user
    #         render json: user
    #     else
    #         render json: { error: 'User not found' }, status: :not_found
    #     end
    # end

    def create
        user = User.new(user_params)
        if user.save
            token = encode_token(user_id: user.id)
            render json: { user: UserSerializer.new(user), token: token }, status: :created
        else
            p '********'
            p user.errors.full_messages
            p '********'
            render json: { error: 'Failed to create user', messages: user.errors.full_messages }, status: :bad_request
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
