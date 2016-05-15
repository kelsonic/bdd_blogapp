# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do 
  User.create!(first_name: Faker::Name.first_name, email: Faker::Internet.email, last_name: Faker::Name.last_name, password: "password")
end

100.times do
  User.find(rand(1..(User.all.size))).articles.create!(title: "How to #{Faker::Hacker.verb} #{Faker::Hacker.noun}", body: "Don't you want to know how to #{Faker::Hacker.verb} #{Faker::Hacker.noun}, too? Let me know how you think we can do this.")
end

200.times do
  Article.find(rand(1..(Article.all.size))).comments.create!(user_id: rand(1..(User.all.size)), body: "#{Faker::Hacker.say_something_smart}")
end