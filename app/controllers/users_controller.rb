class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  def dashboard
    require 'time'
    @bookings = current_user.bookings
    @events = current_user.events
    # look for events for last month and current month, then pass it as an argument to private method iterating on each event to find paid bookings and multiply by event price
    @last_month_events = @events.where(start_date: (Time.now.beginning_of_month.prev_month).midnight..(Time.now.beginning_of_month - 1).midnight)
    @last_month_events_sum = monthly_sum(@last_month_events)
    @current_month_events = @events.where(start_date: (Time.now.beginning_of_month).midnight..Time.now)
    @current_month_events_sum = monthly_sum(@current_month_events)
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
end
