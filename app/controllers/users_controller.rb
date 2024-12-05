class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  def dashboard
    require 'time'
    @bookings = current_user.bookings
    @events = current_user.events
    # Earnings: look for events for last month and current month, then pass it as an argument to private method iterating on each event to find paid bookings and multiply by event price
    @last_month_events = @events.where(start_date: (Time.now.beginning_of_month.prev_month).midnight..(Time.now.beginning_of_month - 1).midnight)
    @last_month_events_sum = monthly_sum(@last_month_events)
    @current_month_events = @events.where(start_date: (Time.now.beginning_of_month).midnight..Time.now)
    @current_month_events_sum = monthly_sum(@current_month_events)
    # Most attended students: list this year events
    @this_year_events = @events.where(start_date: (Time.now.beginning_of_year).midnight..Time.now)
    # in a private method, iterate through paid events to list attendees
    @most_attended_list = most_attended(@this_year_events)
    # Attending students this/last month: based on last/current month events (see above), count bookings for each one and sum
  end

  def show
    @bookings = current_user.bookings
    @events = @user.events
    # @event = @user.events(params[:id])
  end

  def edit

  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def monthly_sum(monthly_events)
    monthly_sum = 0
    monthly_events.each do |event|
      paid_bookings = event.bookings.where(state: "paid")
      event_revenue = paid_bookings.count * event.price_cents
      monthly_sum += event_revenue
    end
    monthly_sum
  end

  def most_attended(yearly_events)
    most_attended = []
    yearly_events.each do |event|
      paid_bookings = event.bookings.where(state: "paid")
      event_attendee_id = paid_bookings.user.id
      most_attended << event_attendee_id
    end
    attendee_frequency = most_attended.tally
    p attendee_frequency
    attendees_sorted_by_frequency = attendee_frequency.sort_by{ |value| [-frequency[value], value]}
    attendees_sorted_by_frequency
  end
end
