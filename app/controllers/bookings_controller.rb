class BookingsController < ApplicationController

  # def index
  #   @event = Event.find(params[:event_id])
  #   @bookings = Booking.where(event_id: @event) # bookings list for this event
  # end
  def create
    @event = Event.find(params[:event_id])
    @booking = Booking.new(event: @event, user: current_user)
    if @booking.save
      redirect_to event_path(@event)
    else
      render event_path(@event), status: :unprocessable_entity
    end
  end
end
