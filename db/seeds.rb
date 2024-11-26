puts "destroy!!!!!!!"

Event.destroy_all
Bookings.destroy_all
Post.destroy_all
User.destroy_all

puts "making locations..."

Location.create(name: "The Wagon", address: "Meguro, Tokyo")
Location.create(name: "Grandma's Pumpkin Patch", address: "Akihabara, Tokyo, Japan, Earth, Solar Sytem, Milky Way")
Location.create(name: "Bigfoot's Crotch", address: "Paris, France")

puts "there are now #{Location.count} locations, nerds..."

puts "making some users"

denis = User.create(name: "Denis", email: "denis@clownpenis.fart", is_teacher: true, description: "I'm a shoe maker for donkeys")
file = File.open("app/assets/images/denis.jpg")
toilet.photos.attach(io: file, filename: "denis.jpg", content_type: "image/jpg")
toilet.save

puts "there are now #{User.count} users, aka losers..."

puts "let's make some events..."

Event.create(title: "Professional Prancing", description: "Dainty yet masculine prancing by the world's foremost prancer", user_id: denis, start_date: Date.today, end_date: (Date.today + 1))

puts "there are now #{Event.count} events as well"

puts "cool. so. how about some bookings..."
while loop_times < 20
  date1 = DateTime.new(2024, 12, 3, 18, rand(1..59), 0)
  date2 = DateTime.new(2024, 12, 3, 19, rand(1..59), 0)
  user1 = User.all.sample
  event = Event.where.not(user_id: user1).sample
  Booking.create!(user: user1, event: event, start_time: date1, end_time: date2, status: "pending")
  loop_times += 1
end

puts "there are now #{Booking.count} bookings as well now as well, too"
