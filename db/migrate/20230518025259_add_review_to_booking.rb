class AddReviewToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :review, :text
  end
end
