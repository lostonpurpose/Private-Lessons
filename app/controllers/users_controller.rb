class UsersController < ApplicationController
  def dashboard
    @bookings = Booking.all
    @events = Event.all # current_user.events
  end
end
