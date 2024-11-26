puts "destroy!!!!!!!"

Event.destroy_all
Booking.destroy_all
Post.destroy_all
User.destroy_all
Location.destroy_all

puts "making locations..."

location1 = Location.create(name: "The Wagon", address: "Meguro, Tokyo")
Location.create(name: "Grandma's Pumpkin Patch", address: "Akihabara, Tokyo, Japan, Earth, Solar Sytem, Milky Way")
Location.create(name: "Bigfoot's Crotch", address: "Paris, France")

puts "there are now #{Location.count} locations, nerds..."

puts "making some users"

denis = User.create!(name: "Denis", email: "denis@clownpenis.fart", is_teacher: true, description: "I'm a shoe maker for donkeys", password: "123456")
file = File.open("app/assets/images/denis.jpg")
denis.photo.attach(io: file, filename: "denis.jpg", content_type: "image/jpg")
denis.save

stuart_student = User.create!(name: "Stuart", email: "stuart@clownpenis.fart", is_teacher: false, description: "I want to learn how to prance practically", password: "123456")
file = File.open("app/assets/images/stuart.jpg")
stuart_student.photo.attach(io: file, filename: "stuart.jpg", content_type: "image/jpg")
stuart_student.save

puts "there are now #{User.count} users, aka losers..."

puts "let's make some events..."

event1 = Event.create!(title: "Professional Prancing", description: "Dainty yet masculine prancing by the world's foremost prancer", user: denis, start_date: Date.today, end_date: (Date.today + 1), location: location1)

puts "there are now #{Event.count} events as well"

puts "cool. so. how about some bookings..."

loop_times = 0
while loop_times < 10
  # date1 = DateTime.new(2024, 12, 3, 18, rand(1..59), 0)
  # date2 = DateTime.new(2024, 12, 3, 19, rand(1..59), 0)
  # user1 = User.all.sample
  # event = Event.where.not(user: user1).sample
  Booking.create!(state: "pending", checkout_session_id: "an id", event: event1, user: stuart_student)
  loop_times += 1
end

puts "there are now #{Booking.count} bookings as well now as well, too"
