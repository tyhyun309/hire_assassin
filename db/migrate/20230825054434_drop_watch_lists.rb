class DropWatchLists < ActiveRecord::Migration[7.0]
  def change
    drop_table :watch_lists
  end
end
