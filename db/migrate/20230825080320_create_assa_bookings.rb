class CreateAssaBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :assa_bookings do |t|
      t.string :status
      t.text :details
      t.string :target_name
      t.string :target_location
      t.date :deadline
      t.text :review
      t.float :rating
      t.float :latitude
      t.float :longitude
      t.references :assa_assassin, null: false, foreign_key: true
      t.references :assa_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
