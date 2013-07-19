post '/' do
  user = User.create(params[:user])
  session[:id] = user.id
  
  redirect "/users/#{user.id}"
end

get '/user/:id' do
  @user = User.find(params[:id])  # get user information


  erb :profile
end
