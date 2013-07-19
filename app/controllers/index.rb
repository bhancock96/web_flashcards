get '/' do
  erb :index
end

get '/decks' do
  @message = "this is a list of all decks page"
  @decks = Deck.all 

  erb :decks
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  @flashcard = @deck.flashcards.first
  # @flashcards = @deck.flashcards 

  erb :play_deck
end

get '/decks/:id/flashcard/' do
  params[:flashcard_id]
  @flashcard = Flashcard.find(params[:flashcard_id])
  
  erb :show_flashcard
end
