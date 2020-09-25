class User < ApplicationRecord
    belongs_to :game 
    has_many :cards, as: :owner
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    validates :password, length: {minimum: 6}


    #grab total value of user's hand
    def total 
        self.cards.map do |card|
            card.true_value 
        end.sum
    end 

end
