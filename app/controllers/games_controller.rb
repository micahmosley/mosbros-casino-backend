class GamesController < ApplicationController
    skip_before_action :authorized, only: [:create, :show]
    def create
        game=Game.create

        render json: game
    end

    def show 
        render json: Game.find(params[:id])
    end 

    def update
        game=Game.find(params[:id])
        turn_result=''

        if params[:move]=='start'
            turn_result=game.start

            render json: turn_result
        elsif params[:move]=='user hit'
            game.get_card(game.deck,game.user)
            # If user busted
            if game.user.score>21
                
            elsif 
                redirect_to user_path
            end 
        elsif params[:move]=='dealer hit'
            game.get_card(game.deck,game.dealer)
            # If dealer busted
            if game.dealer.score>21
              
            elsif 
                redirect_to dealer_path
            end 
        end 
        
        
    end

end
