class AssaBooking < ApplicationRecord
  belongs_to :assa_assassin
  belongs_to :assa_user
end
