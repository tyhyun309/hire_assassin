class DropWatchMovies < ActiveRecord::Migration[7.0]
  def change
    drop_table :watch_movies
  end
end
