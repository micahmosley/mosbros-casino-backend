# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

game=Game.create

deck=Deck.create(game:game)

values=['1','2','3','4','5','6','7','8','9','10','J','Q','K','A']

values.each do |value|
    Card.create(suite: 'clover', color: 'black', value: value, owner: deck)
    Card.create(suite: 'spade', color: 'black', value: value, owner: deck)
    Card.create(suite: 'heart', color: 'red', value: value, owner: deck)
    Card.create(suite: 'diamond', color: 'red', value: value, owner: deck)
end 
