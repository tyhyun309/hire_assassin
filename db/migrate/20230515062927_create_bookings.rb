class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :assassin, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status, default: "Pending"
      t.text :details
      t.string :target_name
      t.string :target_location
      t.date :deadline

      t.timestamps
    end
  end
end
