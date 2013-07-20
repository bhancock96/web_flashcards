get '/' do
  erb :index
end

get '/decks' do
  @message = "this is a list of all decks page"
  @decks = Deck.all 

  erb :decks
end

get '/decks/:id' do
  p session
  @deck = Deck.find(params[:id])
  @flashcard = @deck.flashcards.first
  @flashcards = @deck.flashcards 
  session[:answer] = @flashcard.answer

  erb :play_deck
end

post '/answer' do

  @user_answer = params[:user_answer]
  session[:user_answer] = @user_answer

  if @user_answer == session[:answer]

    redirect '/decks/'
  end
  #compare current card answer to user_answer
end
