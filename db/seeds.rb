puts "destroy!!!!!!!"

Event.destroy_all
Booking.destroy_all
Post.destroy_all
User.destroy_all
Location.destroy_all

puts "making locations..."

location1 = Location.create(name: "The Wagon", address: "Meguro, Tokyo")
location2 = Location.create(name: "Grandma's Pumpkin Patch", address: "Akihabara, Tokyo, Japan, Earth, Solar Sytem, Milky Way")
location3 = Location.create(name: "Bigfoot's Crotch", address: "Paris, France")
location4 = Location.create(name: "Shinjuku Noah studio C", address: "Shinjuku")
location5 = Location.create(name: "Shinjuku Noah studio A", address: "Shinjuku")

puts "there are now #{Location.count} locations, nerds..."

puts "making some users"

denis = User.create!(name: "Denis", email: "denis@clownpenis.fart", is_teacher: true, description: "I'm a shoe maker for donkeys", password: "123456")
file = File.open("app/assets/images/denis.jpg")
denis.photo.attach(io: file, filename: "denis.jpg", content_type: "image/jpg")
denis.save

mitsuki = User.create!(name: "Mitsuki", email: "mitsuki@email.com", is_teacher: true, description: "I'm a popular heels dance teacher", password: "123456")
file = File.open("app/assets/images/mitsuki.jpg")
mitsuki.photo.attach(io: file, filename: "mitsuki.jpg", content_type: "image/jpg")
mitsuki.save

anri = User.create!(name: "Anri", email: "anri@email.com", is_teacher: true, description: "I'm a popular jazz hiphop teacher", password: "123456")
file = File.open("app/assets/images/anri.jpg")
anri.photo.attach(io: file, filename: "anri.jpg", content_type: "image/jpg")
anri.save

yann = User.create!(name: "Yann", email: "yann@email.com", is_teacher: true, description: "I'm a salsa/tap/tango/zumba/hiphop/ballet/house instructor", password: "123456")
file = File.open("app/assets/images/yann.png")
yann.photo.attach(io: file, filename: "yann.png", content_type: "image/jpg")
yann.save

stuart_student = User.create!(name: "Stuart", email: "stuart@clownpenis.fart", is_teacher: false, description: "I want to learn how to prance practically", password: "123456")
file = File.open("app/assets/images/stuart.jpg")
stuart_student.photo.attach(io: file, filename: "stuart.jpg", content_type: "image/jpg")
stuart_student.save

doug_student = User.create!(name: "Doug", email: "doug@email.com", is_teacher: false, description: "professional beginner", password: "123456")
file = File.open("app/assets/images/doug.png")
doug_student.photo.attach(io: file, filename: "doug.png", content_type: "image/png")
doug_student.save

celso_student = User.create!(name: "Celso", email: "celso@email.com", is_teacher: false, description: "Always dreamed of dancing in Swan Lake", password: "123456")
file = File.open("app/assets/images/celso1.png")
celso_student.photo.attach(io: file, filename: "celso1.png", content_type: "image/png")
celso_student.save

will_student = User.create!(name: "Will", email: "will@email.com", is_teacher: false, description: "Love heels dance since I was 10", password: "123456")
file = File.open("app/assets/images/will.png")
will_student.photo.attach(io: file, filename: "will.png", content_type: "image/png")
will_student.save

alisa_student = User.create!(name: "Alisa", email: "alisa@email.com", is_teacher: false, description: "Trying my best okay", password: "123456")
file = File.open("app/assets/images/alisa.png")
alisa_student.photo.attach(io: file, filename: "alisa.png", content_type: "image/png")
alisa_student.save

puts "there are now #{User.count} users, aka losers..."

puts "let's make some events..."

event1 = Event.create!(title: "Professional Prancing", description: "Dainty yet masculine prancing by the world's foremost prancer", user: denis, start_date: Date.today, end_date: (Date.today + 1), location: location1)
event2 = Event.create!(title: "Heels Beginners", description: "Delicious Dances - make desserts while twerking", user: mitsuki, start_date: Date.today, end_date: (Date.today + 1), location: location4)
event3 = Event.create!(title: "Prancing 101", description: "Heels dance class for beginners", user: mitsuki, start_date: Date.today, end_date: (Date.today + 1), location: location5)
Event.create!(title: "Prancing 202", description: "Continue on your prancing journey", user: mitsuki, start_date: Date.today, end_date: (Date.today + 1), location: location2)
Event.create!(title: "Pinnacle of Prance", description: "You'll have a goddamn doctorate in prancing, pantsed or no", user: mitsuki, start_date: Date.today, end_date: (Date.today + 1), location: location3)

puts "there are now #{Event.count} events as well"

puts "cool. so. how about some bookings..."

users = [stuart_student, doug_student, celso_student, will_student, alisa_student]
events = [event1, event2, event3]

selected_event = events.sample
selected_user = users.sample

loop_times = 0
while loop_times < 20
  selected_event = events.sample
  selected_user = users.sample
  # date1 = DateTime.new(2024, 12, 3, 18, rand(1..59), 0)
  # date2 = DateTime.new(2024, 12, 3, 19, rand(1..59), 0)
  # user1 = User.all.sample
  # event = Event.where.not(user: user1).sample
  Booking.create!(state: "pending", checkout_session_id: "an id", event: selected_event, user: selected_user)
  loop_times += 1
end

puts "there are now #{Booking.count} bookings as well now as well, too"
