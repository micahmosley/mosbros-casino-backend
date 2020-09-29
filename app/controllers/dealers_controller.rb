class DealersController < ApplicationController
    skip_before_action :authorized, only: [:show]
    def show
        dealer=Dealer.find(params[:id])
        

        render json: {cards:dealer.cards, player: dealer}
    end 

end
