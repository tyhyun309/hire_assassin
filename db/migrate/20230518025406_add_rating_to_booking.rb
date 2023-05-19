class AddRatingToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :rating, :float
  end
end
