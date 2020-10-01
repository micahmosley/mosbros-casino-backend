class Dealer < ApplicationRecord
    belongs_to :game 
    has_many :cards, as: :owner

    def total 
        ace_count=0
        sum=0
        self.cards.map do |card|
            sum+=card.rank
            if card.value == 'A'
                ace_count+=1
            end 
        end
        #deal with scenario where Ace value needs to go from 11 to 1
        if sum>21 && ace_count>0 
            while(ace_count>0 && sum>21) do 
                sum-=10
                ace_count-=1
            end 
        end 

        self.update(score: sum)
    end 

end
