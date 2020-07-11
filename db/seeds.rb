# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Alex',
             email: 'sample_user@loffets.com',
             password: 'Test111!')

5.times do |i|
  x = i + 1
  User.create!(name: "test#{x}",
               email: "test#{x}@test.com",
               password: "Test#{x}#{x}#{x}!")
end

5.times do |u|
  5.times do |i|
    x = i + 1
    Record.create(title: "record#{x}",
                  start_time: i.days.since,
                  user_id: u + 1)
  end
end

5.times do |u|
  5.times do |i|
    Mywork.create(name: "mywork#{i + 1}",
                  user_id: u + 1)
  end
end

5.times do |u|
  5.times do |i|
    x = (u * 5) + 1
    Workout.create(set: 4,
                   rep: 10,
                   weight: 45 + i,
                   vol: 1,
                   record_id: x + i,
                   mywork_id: x)
  end
end

users = User.all
following = users[1..4]
following.each { |followed| User.first.follow(followed) }
