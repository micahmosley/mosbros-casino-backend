class User < ApplicationRecord
    belongs_to :game 
    has_many :cards, as: :player
end
