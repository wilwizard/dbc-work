Note.delete_all


15.times do
  Note.create(title: Faker::Company.bs, content: Faker::Lorem.paragraph)
end


