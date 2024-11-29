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

bear_student = User.create!(name: "kumamon", email: "bear@honey.com", is_teacher: false, description: "Does you has honey?", password: "123456")
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

event1 = Event.create!(title: "Professional Prancing", description: "Dainty yet masculine prancing by the world's foremost prancer", user: denis, start_date: Date.today + 9, end_date: (Date.today + 10), location: location1, capacity: 10, price: 1100)
event2 = Event.create!(title: "Heels Beginners", description: "Delicious Dances - make desserts while twerking", user: denis, start_date: Date.today + 1, end_date: (Date.today + 2), location: location4, capacity: 10, price: 800)
event3 = Event.create!(title: "Prancing 101", description: "Heels dance class for beginners", user: denis, start_date: Date.today, end_date: (Date.today + 1), location: location5, capacity: 18, price: 1500)
event4 = Event.create!(title: "Prancing 202", description: "Continue on your prancing journey", user: yann, start_date: Date.today, end_date: (Date.today + 1), location: location2, capacity: 12, price: 1000)
event5 = Event.create!(title: "Pinnacle of Prance", description: "You'll have a goddamn doctorate in prancing, pantsed or no", user: mitsuki, start_date: Date.today, end_date: (Date.today + 1), location: location3, capacity: 22, price: 900)
event6 = Event.create!(title: "Slip and Slide", description: "The way of water, if water was a way", user: mitsuki, start_date: Date.today, end_date: (Date.today + 1), location: location2, capacity: 12, price: 1100)
event7 = Event.create!(title: "Prancing 202", description: "Continue on your prancing journey", user: mitsuki, start_date: Date.today + 6, end_date: (Date.today + 7), location: location2, capacity: 12, price: 1000)
event8 = Event.create!(title: "Pinnacle of Prance", description: "You'll have a goddamn doctorate in prancing, pantsed or no", user: mitsuki, start_date: Date.today + 2, end_date: (Date.today + 3), location: location3, capacity: 22, price: 900)
event9 = Event.create!(title: "Slip and Slide", description: "The way of water, if water was a way", user: mitsuki, start_date: Date.today + 3, end_date: (Date.today + 4), location: location2, capacity: 12, price: 1100)
event10 = Event.create!(title: "Donkey Kicking with Alisa", description: "Hi, I'm a professional donkey", user: mitsuki, start_date: Date.today, end_date: (Date.today + 1), location: location3, capacity: 6, price: 1200)
event11 = Event.create!(title: "Phat Rocket", description: "Grab a partner and square dance in a circular fashion", user: anri, start_date: Date.today + 5, end_date: (Date.today + 6), location: location6, capacity: 14, price: 2000)
event12 = Event.create!(title: "Heels Advanced", description: "Like hot yoga, but you're only wearing very high heels. Warning: we will be sharing one pole", user: anri, start_date: Date.today + 8, end_date: (Date.today + 9), location: location7, capacity: 4, price: 3000)
event13 = Event.create!(title: "Polka intensive class", description: "Free your mind and discover the beauty of Central Europe.", user: yann, start_date: Date.today + 9, end_date: (Date.today + 10), location: location1, capacity: 5, price: 3000)

puts "there are now #{Event.count} events as well"

puts "cool. so. how about some bookings..."

events = [event1, event2, event3, event4, event5, event6, event7, event8, event9, event10, event11, event12, event13]
states = ["pending", "paid", "unpaid"]

events.each do |event|
  selected_users = users.sample(25)
    selected_users.each do |user|
    selected_state = states.sample
    Booking.create!(state: selected_state, checkout_session_id: "indecypherable id", event: event, user: user)
  end
end

puts "there are now #{Booking.count} bookings as well now as well, too"
