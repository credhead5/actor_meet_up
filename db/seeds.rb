# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = User.new(username: 'ttjmax', email: 'ttjmax@gmail.com', bio: "Actor from New York" )
# user.save

# user = User.new(username: 'oddsam1', email: 'odd123@email.com', bio: "Actor from LA" )
# user.save

# user = User.new(username: 'lad354', email: 'la354@gmail.com', bio: "Actor from Ohio" )
# user.save

# user = User.new(username: 'leslie324', email: 'leslie324@aol.com', bio: "Actor from Chicago." )
# user.save

User.create!([
  {username: 'ttjmax', email: 'ttjmax@gmail.com', bio: "Actor from New York", password: "password"},
  {username: 'lad354', email: 'la354@gmail.com', bio: "Actor from Ohio", password: "password"},
  {username: 'oddsam1', email: 'odd123@email.com', bio: "Actor from LA", password: "password"},

])




Meeting.create!([
  {seeker_id: 1, fulfiller_id: 3, location: "Shetler Studios", start_time: DateTime.new, end_time: DateTime.new + 1.hour},
  {seeker_id: 2, fulfiller_id: 1, location: "Shetler Studios", start_time: DateTime.new, end_time: DateTime.new + 1.hour},
  {seeker_id: 3, fulfiller_id: 2, location: "Shetler Studios", start_time: DateTime.new, end_time: DateTime.new + 1.hour},
  

])


 Review.create!([
  {evaluator_id: 1, actor_id: 2, text: "will use again, so grateful for your amazingness"},
  {evaluator_id: 2, actor_id: 3, text: "Great Job, hope to use you again"},
  {evaluator_id: 3, actor_id: 1, text: "Life Saver"},
 
])
