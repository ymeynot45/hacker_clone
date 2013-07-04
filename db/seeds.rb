5.times do
  User.create(username: Faker::Internet.user_name, password: "tester")
end

10.times do
  Post.create(title: Faker::Company.bs, article: Faker::Lorem.paragraph(sentence_count = 5, supplemental = false), user_id: rand(1..5))
end

20.times do
  Comment.create(opinion: Faker::Company.catch_phrase, post_id: rand(1..10) , user_id: rand(1..5))
end
