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
User.create!(first_name: "Dillon",
last_name: "Wyatt",
email: 'test@gmail.com', password: '123123')

User.create!(first_name: "Kingsley",
last_name: "Lau",
email: 'kingsley@gmail.com', password: '123123')

10.times do
  user = User.new(first_name: Faker::FunnyName.two_word_name.split(' ')[0],
  last_name: Faker::FunnyName.two_word_name.split(' ')[1],
  email: Faker::Internet.email, password: '123123')
  user.save!
end

level = ['Beginner','Intermediate','Advanced','Native']
duration = [20, 40, 60]

20.times do
  course = Course.new(name: Faker::Educator.course_name, location: ["Tokyo", "Osaka", "Nagoya"].sample, description:
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce gravida purus a lectus auctor, eget sagittis odio scelerisque. Ut vehicula lectus sit amet semper maximus. Curabitur at massa semper, dictum risus ut, venenatis dolor. In at risus et nisl vehicula tempus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin cursus, metus nec dictum scelerisque, lectus turpis porttitor purus, vel efficitur augue tortor in sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Interdum et malesuada fames ac ante ipsum primis in faucibus.

Proin cursus et neque sit amet efficitur. Curabitur vitae sapien sagittis, interdum odio non, volutpat diam. Cras id molestie augue. Curabitur ex nisl, efficitur sit amet pretium eu, dictum eget enim. In aliquet fringilla erat at interdum. Aenean venenatis erat placerat odio rutrum tincidunt. Ut nec justo ac risus tincidunt faucibus. Integer nec ullamcorper lectus, ut auctor ex. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec efficitur a purus a ornare. Suspendisse vel odio sed lorem placerat maximus nec sed elit. Morbi placerat nisl eget nunc placerat fringilla. Sed non massa eget neque malesuada blandit. Curabitur a diam pellentesque, elementum metus eget, volutpat tellus. Vestibulum id consectetur velit.

Integer laoreet ornare ligula, nec bibendum libero faucibus a. Curabitur a fringilla neque. Aenean quam mauris, commodo eu mollis ultricies, commodo eget purus. In hac habitasse platea dictumst. Etiam sem erat, rhoncus sed ex ut, tempus commodo neque. Curabitur at turpis vehicula, semper orci in, dapibus mi. Curabitur blandit eget tortor a dignissim. Donec sed tortor sit amet ipsum rhoncus semper eget in arcu. Phasellus laoreet dolor sit amet ultrices porta. Ut vel dui eget libero laoreet fringilla. Duis tempus ligula ac quam maximus, eget imperdiet purus pretium. Donec ac molestie nisi. Aenean hendrerit bibendum nulla, sit amet sodales sem eleifend sed. Aliquam erat volutpat. Quisque dictum purus auctor metus vulputate vulputate.",
price: [1000, 2000, 3000, 4000, 5000].sample)
  course.user = User.all.sample
  course.duration_list.add(duration.sample)
  course.level_list.add(level.sample)
  course.save!
end

10.times do
  booking = Booking.new(date: rand(1.years).seconds.from_now, status: ["booked", "cancel", "pending"].sample)
  booking.user = User.all.sample
  booking.course = Course.all.sample
  booking.save!
end
puts "finished creating sample"
