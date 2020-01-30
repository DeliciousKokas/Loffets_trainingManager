# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'test1234@test.com', password: '12341234')

5.times do |i|
  Record.create(title:"record#{i}", start_time: i.days.ago, user_id: 1 )
end

5.times do |i|
  Mywork.create(name:"mywork#{i}", user_id: 1)
end

5.times do |i|
  Workout.create(set: 4, rep: 10, weight:45+i , record_id:i+1, mywork_id:1)
end