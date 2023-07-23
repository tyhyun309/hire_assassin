class WatchBookmark < ApplicationRecord
  belongs_to :watch_movie
  belongs_to :watch_list
end
