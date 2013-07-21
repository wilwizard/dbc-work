enable :sessions

get '/' do
  
  # render home page
 #TODO: Show all users if user is signed in
  @current_user = current_user
  @logged_in = (@current_user ? true : false)
  @users = User.all

  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  user = User.find_by_email(params[:email])
  p user
  if user.auth_password(params[:password])
    session.clear
    session[:user_id]=user.id
    redirect '/'
  else
    redirect '/'
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  session.clear
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  user = User.create(params[:user])
  session[:user_id]=user.id
  redirect '/'
end
