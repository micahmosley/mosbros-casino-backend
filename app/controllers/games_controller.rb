class GamesController < ApplicationController

    def create
        Game.create
    end

    def update
        game=Game.find(params[:id])
        user=User.find_by(game: game)
        deck=Deck.find_by(game: game)
        dealer=Dealer.find_by(game: game)
        response=""

        if params[:move]=='start'
            game.start
        elsif params[:move]=='user hit'
            game.get_card(deck,user)
            # If user busted
            if user.total>21
                
            end 
        elsif (params[:move]=='dealer hit'){
            game.get_card(deck,dealer)
            # If dealer busted
            if dealer.total>21
                
            end 
        end 
        
        
    end

end
