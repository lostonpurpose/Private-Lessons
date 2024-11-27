class UsersController < ApplicationController
  def dashboard
    @bookings = current_user.bookings
    @events = current_user.events
  end
end
