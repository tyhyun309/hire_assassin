class Assassin::BookingsController < ApplicationController
  def index
    # Does devise chooses the bookings automatically?
    @bookings = policy_scope([:assassin, Booking])
  end

end
