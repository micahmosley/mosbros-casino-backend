class User < ApplicationRecord
    belongs_to :game 
    has_many :cards, as: :player
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    validates :password, length: {minimum: 6}
end
