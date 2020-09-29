class Deck < ApplicationRecord
    belongs_to :game 
    has_many :cards, as: :owner

    def create_deck 

        values=['2','3','4','5','6','7','8','9','10','J','Q','K','A']

        values.each do |value|
            a=Card.create(suit: 'club', color: 'black', value: value, owner: self)
            a.true_value
            b=Card.create(suit: 'spade', color: 'black', value: value, owner: self)
            b.true_value
            c=Card.create(suit: 'heart', color: 'red', value: value, owner: self)
            c.true_value
            d=Card.create(suit: 'diamond', color: 'red', value: value, owner: self)
            d.true_value
        end 

    end 
end
