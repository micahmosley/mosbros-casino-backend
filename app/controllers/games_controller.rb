class GamesController < ApplicationController
    # skip_before_action :authorized, only: [:create]
    def create
        game=Game.create
        Dealer.create(game:game, name:"Dealer", score:0)

        render json: game
    end

    def show 
        render json: Game.find(params[:id])
    end 

    def update
        game=Game.find(params[:id])
        turn_result=''

        if params[:move]=='start'
            user=User.find(params[:user])
            user.cards.clear
            user.update(game: game)
            turn_result=game.start

            render json: turn_result
        elsif params[:move]=='user hit'
            game.get_card(game.deck,game.user)
            # If user busted
            if game.user.score>21
                render json: {bust: "user", cards:game.user.cards, player: game.user}
            elsif 
                render json: {cards:game.user.cards, player: game.user}
            end 
        elsif params[:move]=='dealer hit'
            game.get_card(game.deck,game.dealer)
            # If dealer busted
            if game.dealer.score>21
                render json: {bust: "dealer", cards:game.dealer.cards, player: game.dealer}
            elsif 
                render json: {cards:game.dealer.cards, player: game.dealer}
            end 
        end 
        
        
    end

end
