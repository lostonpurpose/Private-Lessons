class BookingsController < ApplicationController
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
