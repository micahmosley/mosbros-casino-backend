class Card < ApplicationRecord
    belongs_to :owner, polymorphic: true
    

    #converted value of each card
    def true_value
        if self.value ==='A'
            self.update(rank: 11)
        elsif self.value == 'K' || self.value == 'Q' || self.value == 'J'
            self.update(rank: 10)
        else 
            self.update(rank: self.value.to_i)
        end 
    end 
    
end
