require 'faker'

puts "destroying previous seeds!"

Event.destroy_all
Booking.destroy_all
Post.destroy_all
User.destroy_all
Location.destroy_all

puts "making locations... please wait!"

location1 = Location.create(name: "The Wagon", address: "Meguro")
location2 = Location.create(name: "Grandma's Pumpkin Patch", address: "Akihabara")
location3 = Location.create(name: "Bigfoot's Crotch", address: "Cleveland")
location4 = Location.create(name: "Shinjuku Noah studio C", address: "Koenji")
location5 = Location.create(name: "Alisa's Attic", address: "Nakameguro")
location6 = Location.create(name: "An Abandoned Mine Shaft", address: "Abandoned Mine Shaft")
location7 = Location.create(name: "Girls Bar Moemi", address: "Kabukicho")

puts "there are now #{Location.count} locations, nerds..."

puts "making users who can't wait to move their body"

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

will_teacher = User.create!(name: "Will", email: "will@clownpenis.fart", is_teacher: true, description: "ranked 3rd in Meguro belly dance contest 2020, but 1st in 'most sexy dancer'", password: "123456")
file = File.open("app/assets/images/will.png")
will_teacher.photo.attach(io: file, filename: "will.png", content_type: "image/png")
will_teacher.save

alisa_student = User.create!(name: "Alisa", email: "alisa@email.com", is_teacher: false, description: "I can code as well too now as well", password: "123456")
file = File.open("app/assets/images/alisa.png")
alisa_student.photo.attach(io: file, filename: "alisa.png", content_type: "image/png")
alisa_student.save

bear_student = User.create!(name: "Kumamon", email: "bear@honey.com", is_teacher: false, description: "Does you has honey?", password: "123456")
file = File.open("app/assets/images/bear.jpg")
bear_student.photo.attach(io: file, filename: "bear.jpg", content_type: "image/jpg")
bear_student.save

polish = User.create!(name: "Joshel Dovic", email: "bigjd@clownpenis.fart", is_teacher: false, description: "Very nice!", password: "123456")
file = File.open("app/assets/images/bartek.jpg")
polish.photo.attach(io: file, filename: "bartek.jpg", content_type: "image/jpg")
polish.save

users = [stuart_student, doug_student, celso_student, will_teacher, alisa_student, denis, mitsuki, anri]

n = 0
while n < 20
  newuser= User.create!(name: "#{Faker::FunnyName.name}", email: "#{Faker::Name.first_name}+#{rand(1..2500)}@mail.com", is_teacher: false, description: "#{Faker::Quote.mitch_hedberg}", password: "123456")
  file = File.open("app/assets/images/unknownpic.jpg")
  newuser.photo.attach(io: file, filename: "unknownpic.jpg", content_type: "image/jpg")
  newuser.save
  users.push(User.last)
  n += 1
end

puts "there are now #{User.count} users, aka losers..."
puts "let's make some events..."

event1 = Event.create!(title: "Professional Salsa", description: "Spice up your life with our salsa classes! Enjoy the lively rhythms and passionate movements of this Latin dance.", user: denis, start_date: Date.today + 9, end_date: (Date.today + 10), location: location1, capacity: 10, price: 1100)
file = File.open("app/assets/images/hh1.jpg")
event1.photos.attach(io: file, filename: "hh1.jpg", content_type: "image/jpg")
event1.save
event2 = Event.create!(title: "Heels Beginners", description: "Delicious Dances - make desserts while twerking", user: mitsuki, start_date: Date.today + 1, end_date: (Date.today + 2), location: location4, capacity: 10, price: 800)
file = File.open("app/assets/images/hh2.jpg")
event2.photos.attach(io: file, filename: "hh2.jpg", content_type: "image/jpg")
event2.save
event3 = Event.create!(title: "Salsa 101", description: "Salsa class for beginners", user: denis, start_date: Date.today, end_date: (Date.today + 1), location: location5, capacity: 22, price: 1500)
file = File.open("app/assets/images/hh3.jpg")
event3.photos.attach(io: file, filename: "hh3.jpg", content_type: "image/jpg")
event3.save
event4 = Event.create!(title: "Salsa 202", description: "Salsa class for beginners", user: yann, start_date: Date.today, end_date: (Date.today + 1), location: location2, capacity: 8, price: 1000)
file = File.open("app/assets/images/hh4.jpg")
event4.photos.attach(io: file, filename: "hh4.jpg", content_type: "image/jpg")
event4.save
event5 = Event.create!(title: "Ballroom", description: "Elegance and grace await in our ballroom dance class. Learn classic dances like the waltz, foxtrot, and tango.", user: yann, start_date: Date.today, end_date: (Date.today + 1), location: location3, capacity: 22, price: 900)
file = File.open("app/assets/images/hh5.jpg")
event5.photos.attach(io: file, filename: "hh5.jpg", content_type: "image/jpg")
event5.save
event6 = Event.create!(title: "Belly Dance", description: "Embrace the art of belly dance! Our classes focus on fluid movements and isolations, perfect for improving core strength and flexibility.", user: will_teacher, start_date: Date.today, end_date: (Date.today + 1), location: location2, capacity: 15, price: 1100)
file = File.open("app/assets/images/hh6.jpg")
event6.photos.attach(io: file, filename: "hh6.jpg", content_type: "image/jpg")
event6.save
event7 = Event.create!(title: "Heels advanced", description: "Continue on your heels journey", user: mitsuki, start_date: Date.today + 6, end_date: (Date.today + 7), location: location2, capacity: 12, price: 1000)
file = File.open("app/assets/images/hh7.jpg")
event7.photos.attach(io: file, filename: "hh7.jpg", content_type: "image/jpg")
event7.save
event8 = Event.create!(title: "Pinnacle of Prance", description: "You'll have a goddamn doctorate in prancing, pantsed or no", user: will_teacher, start_date: Date.today + 2, end_date: (Date.today + 3), location: location3, capacity: 22, price: 900)
file = File.open("app/assets/images/hh8.jpg")
event8.photos.attach(io: file, filename: "hh8.jpg", content_type: "image/jpg")
event8.save
event9 = Event.create!(title: "Slip and Slide", description: "The way of water, if water was a way", user: will_teacher, start_date: Date.today + 3, end_date: (Date.today + 4), location: location2, capacity: 12, price: 1100)
file = File.open("app/assets/images/hh9.jpg")
event9.photos.attach(io: file, filename: "hh9.jpg", content_type: "image/jpg")
event9.save
event10 = Event.create!(title: "Contemporary", description: "Explore creativity and emotion in our contemporary dance class. Combine elements of ballet, modern, and jazz for a unique dance experience.", user: mitsuki, start_date: Date.today, end_date: (Date.today + 1), location: location3, capacity: 6, price: 1200)
file = File.open("app/assets/images/hh10.jpg")
event10.photos.attach(io: file, filename: "hh10.jpg", content_type: "image/jpg")
event10.save
event11 = Event.create!(title: "Breakdance", description: "Join our breakdance class and master the art of b-boying and b-girling. Learn power moves, freezes, and top rocks in a supportive environment.", user: anri, start_date: Date.today + 5, end_date: (Date.today + 6), location: location6, capacity: 14, price: 2000)
file = File.open("app/assets/images/hh11.jpg")
event11.photos.attach(io: file, filename: "hh11.jpg", content_type: "image/jpg")
event11.save
event12 = Event.create!(title: "Heels Advanced", description: "Like hot yoga, but you're only wearing very high heels. Warning: we will be sharing one pole", user: anri, start_date: Date.today + 8, end_date: (Date.today + 9), location: location7, capacity: 4, price: 3000)
file = File.open("app/assets/images/hh12.jpg")
event12.photos.attach(io: file, filename: "hh12.jpg", content_type: "image/jpg")
event12.save
event13 = Event.create!(title: "Polka intensive class", description: "Free your mind and discover the beauty of Central Europe.", user: will_teacher, start_date: Date.today + 9, end_date: (Date.today + 10), location: location1, capacity: 5, price: 3000)
file = File.open("app/assets/images/hh13.jpg")
event13.photos.attach(io: file, filename: "hh13.jpg", content_type: "image/jpg")
event13.save
event14 = Event.create!(title: "Breakdance", description: "Join our breakdance class and master the art of b-boying and b-girling. Learn power moves, freezes, and top rocks in a supportive environment.", user: anri, start_date: Date.today + 5, end_date: (Date.today + 6), location: location6, capacity: 14, price: 2000)
file = File.open("app/assets/images/hh14.jpg")
event14.photos.attach(io: file, filename: "hh14.jpg", content_type: "image/jpg")
event14.save
event15 = Event.create!(title: "Heels Advanced", description: "Like hot yoga, but you're only wearing very high heels. Warning: we will be sharing one pole", user: anri, start_date: Date.today + 8, end_date: (Date.today + 9), location: location7, capacity: 4, price: 3000)
file = File.open("app/assets/images/hh15.jpg")
event15.photos.attach(io: file, filename: "hh15.jpg", content_type: "image/jpg")
event15.save
event16 = Event.create!(title: "Polka intensive class", description: "Free your mind and discover the beauty of Central Europe.", user: will_teacher, start_date: Date.today + 9, end_date: (Date.today + 10), location: location1, capacity: 5, price: 3000)
file = File.open("app/assets/images/hh16.jpg")
event16.photos.attach(io: file, filename: "hh16.jpg", content_type: "image/jpg")
event13.save

puts "there are now #{Event.count} events as well"

puts "cool. so. how about some bookings..."

events = [event1, event2, event3, event4, event5, event6, event7, event8, event9, event10, event11, event12, event13]
states = ["pending", "paid"]

events.each do |event|
  random_count = rand(3..25)
  p event.user.name
  temp_users = users.reject { |h| h["name"] == "#{event.user.name}" }
  selected_users = temp_users.sample(random_count)
    selected_users.each do |user|
    selected_state = states.sample
    Booking.create!(state: selected_state, checkout_session_id: "indecypherable id", event: event, user: user)
  end
end

puts "there are now #{Booking.count} bookings as well now as well, too"
