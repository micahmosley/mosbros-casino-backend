class GamesController < ApplicationController

    def create
        Game.create
    end

    def update
        game=Game.find(params[:id])
        game.start
    end

end
