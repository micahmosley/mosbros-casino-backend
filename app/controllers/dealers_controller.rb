class DealersController < ApplicationController
    def show
        dealer=Dealer.find(params[:id])
        

        render json: dealer.cards
    end 

end
