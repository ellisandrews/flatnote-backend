class UsersController < ApplicationController

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
        user = User.find_or_create_by(user_params)
        render json: user
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end

end
