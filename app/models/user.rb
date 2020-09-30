class User < ApplicationRecord
    belongs_to :game 
    has_many :cards, as: :owner
    has_secure_password
    # validates :username, uniqueness: { case_sensitive: false }
    # validates :password, length: {minimum: 6}


    #grab total value of user's hand
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
        puts('USER SCORE UPDATE')
        puts(self.score)
    end 

end
