class Game < ApplicationRecord
    has_one :user
    has_one :dealer


    def start 
        deck=Deck.create(game:self)
        dealer=Dealer.create(game:self name:"Dealer")
        deck.create_deck

        ## get array of all cards in deck 
        deck=deck.cards
        deck=deck.shuffle

        ## deal two cards to dealer and user
        2.times {
            get_card(deck, self.user)
            get_card(deck, self.dealer)
        }



    end 

    def get_card(deck, player)
        card=deck.pop()
        #update card's owner from the deck to the player
        card.update(owner: player.class.find_by(game: self))
    end 

end
