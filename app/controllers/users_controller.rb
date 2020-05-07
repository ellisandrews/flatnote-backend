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
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: { error: 'User creation failed' }, status: :bad_request
        end
    end

    private

    def user_params
        params.permit(:username, :password)
    end

end
