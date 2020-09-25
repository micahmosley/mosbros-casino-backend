class Card < ApplicationRecord
    belongs_to :player, polymorphic: true
    
end
