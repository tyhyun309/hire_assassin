class CreateWatchMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :watch_movies do |t|
      t.string :title
      t.string :overview
      t.string :rating
      t.string :poster_url

      t.timestamps
    end
  end
end
