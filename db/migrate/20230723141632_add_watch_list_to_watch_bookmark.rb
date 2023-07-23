class AddWatchListToWatchBookmark < ActiveRecord::Migration[7.0]
  def change
    add_reference :watch_bookmarks, :watch_list, null: false, foreign_key: true
  end
end
