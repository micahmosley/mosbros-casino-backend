class UsersController < ApplicationController


    def create 
        user = User.create(user_params)
        if user.valid? 
            render json: user, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            redirect_to user_path(@user)
        else
            render json: { error: user.errors.full_messages }, status: :not_acceptable
        end
    end

    private 

    def user_params 
        params.require(:user).permit(:username, :password)
    end
end
