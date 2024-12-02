class PaymentsController < ApplicationController
  def new
    @booking = current_user.bookings.where(state: "pending").find(params[:booking_id])
    @event = Event.find(@booking.event.id)
  end
end
