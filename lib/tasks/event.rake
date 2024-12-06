namespace :event do
  desc "Create default bookings for last event"
  task create_bookings: :environment do
    event = Event.order(:created_at).last
    User.where.not(id: event.user).take(25).each do |user|
      puts "Creating booking for #{user.email}"
      Booking.create(event: event, user: user, state: 'paid')
    end
  end
end
