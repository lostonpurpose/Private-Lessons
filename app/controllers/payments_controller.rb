class PaymentsController < ApplicationController
  def new
    @booking = current_user.bookings.where(state: "pending").find(params[:booking_id])
    @event = Event.find(@booking.event.id)
  end

  def fake
    @event = Event.find(params[:event_id])
    @new_booking = Booking.new # instance to allow new booking
  end
end
