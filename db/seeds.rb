require 'faker'

@decks = ["Math"]

10.times do 
  Deck.new(name: @decks.sample)
end
