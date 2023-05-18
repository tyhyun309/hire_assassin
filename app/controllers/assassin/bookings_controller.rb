class Assassin::BookingsController < ApplicationController
  before_action :set_booking, only: [:update]

  def index
    # Does devise chooses the bookings automatically?
    @assassin = current_user.assassin
    @bookings = policy_scope([:assassin, Booking])
    @bookings_with_markers = @bookings.geocoded.map do |booking|
      {
        booking: booking,
        lat: booking.latitude,
        lng: booking.longitude,
        info_window_html: render_to_string(partial: "bookings/info_window", locals: {booking: booking}),
        marker_html: render_to_string(partial: "bookings/marker")
      }
    end
  end

  def update
    @bookings = policy_scope([:assassin, Booking])
    authorize([:assassin, @booking])
    if @booking.update(booking_params)
      redirect_to assassin_bookings_path(@booking)
    else
      render "assassin/bookings/index", status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :details, :target_name, :target_location, :deadline, :proof)
  end
end
