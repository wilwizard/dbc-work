get '/' do


  @response = Twitter.user("wilwizard")
  @status = @response.status
  p @status
  @response.attrs.each do |key, value|
    p "#{key} = #{value}"
  end
  # Look in app/views/index.erb
  erb :index
end


get '/:handle' do
  @user = User.find_or_create_by_handle(params[:handle])

  if @user.tweets_stale?
    erb :get_stale_tweets
  else
    @tweets = @user.tweets.reverse[0..9]
    erb :get_tweets
  end
end


post '/fetch/:handle' do
  @user = User.find_or_create_by_handle(params[:handle])
  @user.fetch_tweets! 
  @tweets = @user.tweets.reverse[0..9]
  erb :tweets, :layout => false
end


get '/:handle/followers' do
  @user = User.find_or_create_by_handle(params[:handle])

  if @user.followers_stale?
    erb :get_stale_followers
  else
    @followers = @user.followers
    erb :get_followers
  end
end

post '/fetch/:handle/followers' do
  @user = User.find_or_create_by_handle(params[:handle])
  @user.fetch_followers! 
  @followers = @user.followers

  erb :followers, :layout => false
end