class Deck < ApplicationRecord
    belongs_to :game 
    has_many :cards, as: :owner

    def create_deck 

        values=['2','3','4','5','6','7','8','9','10','J','Q','K','A']

        values.each do |value|
            Card.create(suite: 'clover', color: 'black', value: value, owner: self)
            Card.create(suite: 'spade', color: 'black', value: value, owner: self)
            Card.create(suite: 'heart', color: 'red', value: value, owner: self)
            Card.create(suite: 'diamond', color: 'red', value: value, owner: self)
        end 

    end 
end
