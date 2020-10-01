class Game < ApplicationRecord
    has_one :user
    has_one :dealer
    has_one :deck


    def start 
        deck=Deck.create(game:self)
        dealer=Dealer.find_by(game:self)
        dealer.cards.clear
        deck.create_deck

        ## deal one card to dealer and user
        
        self.get_card(deck, self.user)
        self.get_card(deck, self.dealer)
        

        

        #check to see if this hand is over due to blackjack 

        if self.user.score==21 && self.dealer.score==21 
            return {gameState: "complete",
                    result: "PUSH"}
        elsif self.user.score==21 && self.dealer.score!=21 
            return {gameState: "complete",
                result: "You WIN"}
        elsif self.user.score!=21 && self.dealer.score==21 
            return {gameState: "complete",
                result: "Dealer WIN"}
        end 

        return {gameState: "ongoing",
            result: "none"}



    end 

    def get_card(deck, player)
        deck=deck.cards.shuffle
        #remove card from deck
        card=deck.pop()
        #update card's owner from the deck to the player
        card.update(owner: player)
        #update player's score with new card added
        player.total
    end 


end
