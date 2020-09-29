class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :login]

    def create 
        user = User.new(username: params[:username], password: params[:password], game_id: params[:game_id], score:0)
        if user.save
            token = encode_token(user_id: user.id)
            render json: { user: user, jwt: token }, status: :created
        else
            render json: { error: user.errors.full_messages }, status: :not_acceptable
        end
    end

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            token = encode_token({ user_id: user.id })
            render json: { user: user, jwt: token }, status: :accepted
        else
            if user == nil 
                render json: { error: ["That user does not exist." ] }, status: :unauthorized
            else
                render json: { error: ["Password is incorrect" ] }, status: :unauthorized
            end
        end
    end

    def show
        user=User.find(params[:id])
        

        render json: user.cards
    end 

    

    private 

    # def user_params 
    #     params.require(:user).permit(:username, :password)
    # end
end
