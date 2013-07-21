def extract_tags(tag_string)
  tag_string.split(',').map do |tag| 
    Tag.find_or_create_by_topic(tag.strip)
  end
end

get '/' do
  erb :index
end

get '/posts/new' do
  erb :new_post
end

post '/posts' do
  @posts = []
  params[:post][:tags] = extract_tags(params[:tags])
  @posts << Post.create(params[:post])
  redirect("/posts/#{@posts[0].id}")
end

get "/posts" do
  @posts = Post.all
  erb :show_posts
end

get "/posts/:id" do
  @posts = []
  @posts << Post.find(params[:id])
  erb :show_posts
end

get '/:tag/posts' do
  tag = Tag.find_by_topic(params[:tag])
  @posts = tag.posts
  erb :show_posts
end