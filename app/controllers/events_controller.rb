class EventsController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @events = Event.all
    @event_bookings = Booking.where(events_id: @events)
    @bookings = @user.bookings
  end

  def new
    @event = Event.new
  end

  def show
    @user = current_user # teacher user organizing this event (= teacher)
    @event = Event.find(params[:id]) # event I identify through show url id
    @bookings = Booking.where(event_id: @event) # bookings list for this event
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

  def update

  end

  private

  def event_params
    params.require(:event).permit(:title, :capacity, :price, :location_id, :start_date, :end_date)
  end
end
