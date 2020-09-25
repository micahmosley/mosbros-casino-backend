class Dealer < ApplicationRecord
    belongs_to :game 
    has_many :cards, as: :owner
end
