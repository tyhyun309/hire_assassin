class BookingsController < ApplicationController
  before_action :set_booking, only: [:update]
  # User can see all of their bookings
  def index
    @bookings = policy_scope(Booking)
    if params[:query].present?
      @bookings = @bookings.search_by_name_location_status(params[:query])
    end
    # ? Does device do this auotmatically? Fix this tomorrow.
    # The `geocoded` scope filters only bookings with coordinates
    # I don't think we need this code because it is in the _booking_map.html.erb
    @bookings_with_markers = @bookings.geocoded.map do |booking|
      {
        booking: booking,
        lat: booking.latitude,
        lng: booking.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {booking: booking}),
        marker_html: render_to_string(partial: "marker")
      }
    end
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
    params.require(:booking).permit(
      :status, :details, :target_name, :target_location, :deadline, :review, :rating, :assa_booking_id
    )
  end
end
