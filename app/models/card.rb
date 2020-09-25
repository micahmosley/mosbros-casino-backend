class Card < ApplicationRecord
    belongs_to :dealer 
    belongs_to :user 
    
end
