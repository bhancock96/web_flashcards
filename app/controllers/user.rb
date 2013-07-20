post '/' do
  user = User.create(params[:user])
  session[:id] = user.id
  
  redirect "/users/#{user.id}"
end

get '/users/:id' do
    @user = User.find(params[:id])
    if session[:id] == @user.id 
      @round = Round.where(user_id: @user.id)  # get user information
    # @number_of_guesses = round.guesses.count
    # @correct_guesses = round.guesses.where(:correct => true).count
    # @guess_percentage = (@correct_guesses/@number_of_guesses) * 100

      erb :profile
  else
    redirect "/users/#{session[:id]}"
  end
end

post '/login' do
  @user = User.authenticate(params[:username], params[:password])

  if @user == false
    redirect '/'
  else
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  end
end

# add logout
get '/logout' do
  session[:id] = nil

  redirect '/'
end
