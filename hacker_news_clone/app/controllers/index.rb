enable :sessions

get '/' do
  erb :index
end

get '/posts' do
  @posts = Post.all.reverse
  erb :posts
end

post '/users/new' do
  @user = User.create(params[:user])
  session["user"] = @user.id
  redirect '/posts'
end

post '/sessions/new' do
  @user = User.authenticate(params[:user])
  if @user
    session["user"] = @user.id
    redirect '/posts'
  else
    password = nil
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/posts/new' do
  erb :new_post
end

post '/posts/new' do
  post = params[:post]
  @post = Post.create(title: post[:title], url: post[:url], user_id: session["user"])
  erb :post_detail
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @comments = @post.comments
  erb :post_detail
end

post '/comments/new' do 
  comment = params[:comment]
  @post = comment[:post_id]

  Comment.create(content: comment[:content], post_id: comment[:post_id], user_id: session["user"])
  redirect "/posts/#{@post}"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :user_detail
end

get '/users/:id/posts' do
  @user = User.find(params[:id])
  erb :user_posts
end

get '/users/:id/comments' do
  @user = User.find(params[:id])
  erb :user_comments
end

post "/posts/:id/upvote" do
  Postvote.create(post_id: params[:id], user_id: session["user"], is_up: true )
  Post.find(params[:id]).vote_count.to_s
end

post "/posts/:id/downvote" do
  Postvote.create(post_id: params[:id], user_id: session["user"], is_up: false )
  Post.find(params[:id]).vote_count.to_s
end
