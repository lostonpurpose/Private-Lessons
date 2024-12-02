class BookingsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @booking = Booking.create!(event: @event, user: current_user, state: 'pending')

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        amount: @event.price_cents,
        quantity: 1
      }],
      success_url: booking_url(@booking), # Expectation that these two aren't correct
      cancel_url: booking_url(@booking)   # This one too
    )

    @booking.update(checkout_session_id: session.id)
    redirect_to new_booking_payment_path(@booking)
  end

  def bookit
    @event = Event.find(params[:event_id])
    @new_booking = Booking.new
  end

end
