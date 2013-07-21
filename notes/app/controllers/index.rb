get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/notes/new/?' do 
  erb :create_note
end

post '/notes/new' do 
  Note.create(title: params[:title], content: params[:content])
  redirect "/notes/#{Note.last.id}"
end


get '/notes/all/?' do
  @notes = Note.all.reverse
  erb :view_notes
end

get '/notes/:note_id/?' do
  @notes = [Note.find(params[:note_id].to_i)]
  erb :view_notes
end

# get '/notes/:note_id/edit' do
#   puts "here"
#   @note = Note.find(params[:note_id].to_i)
#   erb :_edit_note, { :layout => false }
# end

get '/notes/:note_id/edit' do
  @note=Note.find(params[:note_id].to_i)
  erb :_edit_note
end


put '/notes/:note_id' do
  note = Note.find(params[:note_id].to_i)
  note[:title]=params[:note][:title]
  note[:content]=params[:note][:content]
  note.save
  redirect "/notes/#{params[:note_id]}"
end


delete '/notes/:note_id' do
  note = Note.find(params[:note_id])
  note.delete
  redirect '/notes/all'
end



