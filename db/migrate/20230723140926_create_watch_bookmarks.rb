class CreateWatchBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :watch_bookmarks do |t|
      t.string :comment

      t.timestamps
    end
  end
end
