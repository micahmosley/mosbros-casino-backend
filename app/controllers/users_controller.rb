class UsersController < ApplicationController


    def create 
        user = User.new(username: params[:username], password: params[:password], game_id: params[:game_id])
        puts user
        if user.save
            render json: user, status: :created
        else
            render json: { error: user.errors.full_messages }, status: :not_acceptable
        end
    end

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: user, status: :accepted
        else
            if user == nil 
                render json: { error: ["That user does not exist." ] }, status: :not_acceptable
            else
                render json: { error: ["Password is incorrect" ] }, status: :not_acceptable
            end
        end
    end

    private 

    # def user_params 
    #     params.require(:user).permit(:username, :password)
    # end
end
