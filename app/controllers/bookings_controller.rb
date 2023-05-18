class BookingsController < ApplicationController
  before_action :set_booking, only: [:update]
  # User can see all of their bookings
  def index
    @bookings = policy_scope(Booking)
    if params[:query].present?
      @bookings = @bookings.search_by_name_location_status(params[:query])
    end
    # ? Does device do this auotmatically? Fix this tomorrow.
  end

  # User can create a booking in the Assassin's page
  def create
    @booking = Booking.new(booking_params)
    @assassin = Assassin.find(params[:assassin_id])
    @booking.assassin = @assassin
    @user = current_user
    @booking.user = @user

    authorize @assassin
    if @booking.save
      redirect_to bookings_path
    else
      render "assassins/show", status: :unprocessable_entity
    end
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render "assassin/show", status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  # what if you only allow to update one attribute for a specific action? do we still make a global strong params?
  def booking_params
    params.require(:booking).permit(:status, :details, :target_name, :target_location, :deadline, :review, :rating)
  end
end
