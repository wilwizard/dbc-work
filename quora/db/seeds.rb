# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

User.destroy_all
Question.destroy_all
Answer.destroy_all


users = []

2.times do
  user_args = {}
  user_args[:username] = Faker::Internet.user_name
  user_args[:email] = Faker::Internet.email
  user_args[:password] = "password"

  users << User.create(user_args)
end

questions = []

10.times do
  question = Question.new(question: Faker::Lorem.sentence)
  question.user = users.sample
  question.save
  questions << question
end


questions.each do |q|
  answers = []
  10.times do
    answer = Answer.new(answer: Faker::Lorem.sentence)
    answer.question = q
    answer.user = users.sample
    answer.save
    answers << answer
  end
  q.best_answer = answers.sample
  q.save
end

