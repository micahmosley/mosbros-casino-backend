class Game < ApplicationRecord
    has_one :user
    has_one :dealer

end
