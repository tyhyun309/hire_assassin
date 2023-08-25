class DropWatchBookmarks < ActiveRecord::Migration[7.0]
  def change
    drop_table :watch_bookmarks
  end
end
