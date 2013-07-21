enable :sessions

get '/' do
  erb :index
end

post '/' do
  @user = User.find(session[:user_id])

  unless params[:num]
    jid = @user.tweet(params[:tweet])
  else
    jid = @user.tweet_in(params[:num].to_i, params[:tweet])
  end
  jid
end

get '/sign_in' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  redirect request_token.authorize_url
end

get '/sign_out' do
  session.clear
  redirect '/'
end

get '/status/:job_id' do
  content_type :json
  p "In the GET /status/jobid #{params[:job_id]}"
  p "Job_is_complete returns: #{job_is_complete(params[:job_id])}"
  p "Job_is_complete returns: #{job_is_complete(params[:job_id]).class}"
  { complete: job_is_complete(params[:job_id]) }.to_json
end

get '/auth' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  # our request token is only valid until we use it to get an access token, so let's delete it from our session
  session.delete(:request_token)

  user_data = @access_token.params

  user = User.create(username: user_data[:screen_name],
                      oauth_token: user_data[:oauth_token], 
                      oauth_secret: user_data[:oauth_token_secret])

  session[:user_id] = user.id

  erb :index
  
end
