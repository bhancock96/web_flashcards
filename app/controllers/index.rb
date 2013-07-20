get '/' do
  erb :index
end

get '/decks' do
  if session[:id]
    @message = "this is a list of all decks page"
    @decks = Deck.all 

    erb :decks
  else
    redirect '/'
  end
end


'/rounds/:round_id/card/:id'



get '/decks/:deck_id/:card_id' do
  if session[:id] 
    @deck = Deck.find(params[:deck_id])
    @flashcard = Flashcard.find(params[:card_id])
    if @flashcard == @deck.flashcards.first
      # current_user.rounds.build
      @round = Round.create(:user_id => session[:id])
      session[:round_id] = @round.id
    end

    session[:answer] = @flashcard.answer
    session[:flashcard_id] = @flashcard.id 
    session[:deck_id] = @deck.id 
    erb :play_deck
  else
    redirect '/'
  end
end

post '/answer' do
  if session[:id] 
    @user_answer = params[:user_answer]
    @answer = session[:answer]
    session[:user_answer] = @user_answer
    @flashcard_id = session[:flashcard_id]
    @deck = session[:deck_id]

    @end_of_the_deck = Deck.find(@deck).flashcards.length
    

    @guess = Guess.create(:user_answer => params[:user_answer], :flashcard_id => session[:flashcard_id], :round_id => session[:round_id])

    if @user_answer == session[:answer]
      @guess.update_attributes(:correct => true)
      erb :good_job
    else
      erb :bad_job
    end
  else
    redirect '/'
  end

end
