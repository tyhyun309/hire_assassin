class Assassin::BookingsController < ApplicationController
  before_action :set_booking, only: [:update]

  def index
    # Does devise chooses the bookings automatically?
    @assassin = current_user.assassin
    @bookings = policy_scope([:assassin, Booking])
    if params[:query].present?
      @bookings = @bookings.search_by_name_location_status_detail(params[:query])
    end

    @booking = Booking.new # Just created for render simple form

    @score = 0
    @assassin.bookings.each do |booking|
      if booking.status == 'Completed' && booking.rating.present?
        @score += booking.rating
      end
    end
    @score /= @assassin.bookings.count
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
    params.require(:booking).permit(:status, :details, :target_name, :target_location, :deadline, :proof, :review, :rating)
  end
end
