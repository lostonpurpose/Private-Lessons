class EventsController < ApplicationController

  def index
    @user = current_user
    @events = @user.events
    @event_bookings = Booking.where(events_id: @events)
    @bookings = @user.bookings
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
      if @event.save
        redirect_to root_path #need to change this to dashboard
      else
        render 'new', status: :unprocessable_entity
      end
  end

  private

  def event_params
    params.require(:event).permit(:title, :capacity, :price, :location_id, :start_date, :end_date)
  end
end
