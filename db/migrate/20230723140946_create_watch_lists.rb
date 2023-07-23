class CreateWatchLists < ActiveRecord::Migration[7.0]
  def change
    create_table :watch_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
