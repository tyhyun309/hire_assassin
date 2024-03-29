class Assassin::BookingsController < ApplicationController
  before_action :set_booking, only: [:update]

  def index
    # Does devise chooses the bookings automatically?
    @assassin = current_user.assassin
    @bookings = policy_scope([:assassin, Booking])

    @bookings_with_markers = @bookings.geocoded.map do |booking|
      {
        booking:,
        lat: booking.latitude,
        lng: booking.longitude,
        info_window_html: render_to_string(partial: "bookings/info_window", locals: { booking: }),
        marker_html: render_to_string(partial: "bookings/marker")
      }
    end

    @bookings = @bookings.search_by_name_location_status_detail(params[:query]) if params[:query].present?

    @booking = Booking.new # Just created for render simple form

    @score = 0
    @assassin.bookings.each do |booking|
      @score += booking.rating if booking.status == 'Completed' && booking.rating.present?
    end
    @score /= if @assassin.bookings.select { |booking| booking.rating.present? }.count.zero?
                1
              else
                @assassin.bookings.select do |booking|
                  booking.rating.present?
                end.count
              end
    @score = @score.round(2)
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
    params.require(:booking).permit(:status, :details, :target_name, :target_location, :deadline, :proof, :review,
                                    :rating, :assa_booking_id, :assa_assassin_id, :assa_user_id)
  end
end
