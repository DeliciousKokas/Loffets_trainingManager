# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: 'test1', email: 'test1@test.com', password: 'Test111!')
user2 = User.create(name: 'test2', email: 'test2@test.com', password: 'Test222!')

2.times do |u|
  5.times do |i|
    Record.create(title:"record#{i}", start_time: i.days.since, user_id: u+1)
  end
end

2.times do |u|
  5.times do |i|
    Mywork.create(name:"mywork#{i}", user_id: u+1)
  end
end

5.times do |i|
  Workout.create(set: 4, rep: 10, weight:45+i, record_id:i+1, mywork_id:1)
end