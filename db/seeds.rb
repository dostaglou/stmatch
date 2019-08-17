# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all if Rails.env.development?
Course.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

puts "started creating sample"
User.create!(first_name: Faker::FunnyName.two_word_name.split(' ')[0],
last_name: Faker::FunnyName.two_word_name.split(' ')[1],
email: 'test@gmail.com', password: '123123')

10.times do
  user = User.new(first_name: Faker::FunnyName.two_word_name.split(' ')[0],
  last_name: Faker::FunnyName.two_word_name.split(' ')[1],
  email: Faker::Internet.email, password: '123123')
  user.save!
end
10.times do
  course = Course.new(name: Faker::Educator.course_name, level_list: ['Beginner','Intermediate','Advanced','Native'].sample, duration_list: [20, 40, 60].sample, description: Faker::GreekPhilosophers.quote)
  course.user = User.all.sample
  course.save!
end
10.times do
  booking = Booking.new(date: rand(1.years).seconds.from_now, location: Faker::Address.full_address, status: ["booked", "cancel", "pending"].sample)
  booking.user = User.all.sample
  booking.course = Course.all.sample
  booking.save!
end
puts "finished creating sample"

User.create(first_name: "Kingsley", last_name: "Lau", email: "lau.kingsley@gmail.com", password: "123123")

Course.create(name: "JT", level_list: $level[1], duration_list: $duration[1], description: "I love mos burger, I hate alcohol")
