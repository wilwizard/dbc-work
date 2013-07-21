require 'faker'

User.delete_all
Comment.delete_all
Post.delete_all

10.times do
  User.create(name: Faker::Internet.user_name)
end

30.times do
  post = Post.create()
  post[:title] = Faker::Company.catch_phrase
  post[:url] = Faker::Internet.url
  post.user = User.all.sample
  post.save
end

60.times do 
  comment = Comment.create()
  comment[:content] = Faker::Lorem.paragraph
  comment.user = User.all.sample
  comment.post = Post.all.sample
  comment.save
end

100.times do 
  vote = Postvote.create()
  vote.user = User.all.sample
  vote.post = Post.all.sample
  vote.is_up = [true, false].sample
  vote.save
end

200.times do 
  vote = Commentvote.create()
  vote.user = User.all.sample
  vote.comment = Comment.all.sample
  vote.is_up = [true, false].sample
  vote.save
end




