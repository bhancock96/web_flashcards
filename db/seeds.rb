require 'csv'

math_deck = Deck.create(name: "Math")

CSV.foreach('math_deck.csv', :headers => true, :header_converters => :symbol) do |row|
  math_deck.flashcards << Flashcard.create(Hash[row])
end

User.create(name: "Priya", username: "pri1229", password_hash: "123dbc")  


