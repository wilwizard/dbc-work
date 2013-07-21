get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :new_event
end

post '/events/create' do
  #TODO IMPLEMENT ME
  e = Event.create(params[:event])
  unless e.errors.messages=={}
    @errors = true
    @error_messages = e.errors.messages
    p @error_messages
    erb :new_event
  else
    p 'here'
    redirect '/'
  end

end
