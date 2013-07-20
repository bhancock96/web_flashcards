get '/' do
  erb :index
end

get '/decks' do
  @message = "this is a list of all decks page"
  @decks = Deck.all 

  erb :decks
end

get '/decks/:deck_id/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @flashcard = Flashcard.find(params[:card_id])
  
  session[:answer] = @flashcard.answer
  session[:flashcard_id] = @flashcard.id 
  session[:deck_id] = @deck.id 
  erb :play_deck
end

post '/answer' do

  @user_answer = params[:user_answer]
  @answer = session[:answer]
  session[:user_answer] = @user_answer
  @flashcard_id = session[:flashcard_id]
  @deck = session[:deck_id]

  @end_of_the_deck = Deck.find(@deck).flashcards.length

  if @user_answer == session[:answer]
    erb :good_job
  else
    erb :bad_job
  end

end
