class Assassin::BookingsController < ApplicationController
  def index
    # Does devise chooses the bookings automatically?
    @bookings = Bookings.all
  end
end
