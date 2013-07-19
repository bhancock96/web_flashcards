post '/' do
  user = User.create(params[:user])
  session[:id] = user.id
  
  redirect "/users/#{user.id}"
end

get '/users/:id' do
  @user = User.find(params[:id])  # get user information

  erb :profile
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

