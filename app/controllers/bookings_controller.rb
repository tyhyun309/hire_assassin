class BookingsController < ApplicationController

  before_action :set_booking, only: [:create, :update]
  # User can see all of their bookings
  def index
    @bookings = policy_scope(Booking)
    # ? Does device do this auotmatically? Fix this tomorrow.
  end

  # User can create a booking in the Assassin's page
  def create
    @assassin = Assassin.find(params[:assassin_id])
    @bookings.assassin = @assassin
    if @bookings.save
      redirect_to bookings_path
    else
      render "assassin/show", status: :unprocessable_entity
    end
  end

  def update
    if @bookings.update(booking_params)
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
    params.require(:booking).permits(:details, :target_name, :target_location, :deadline)
  end
end
