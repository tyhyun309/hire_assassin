class Booking < ApplicationRecord
  self.table_name = "assa_bookings"
  belongs_to :assassin, foreign_key: "assa_assassin_id"
  belongs_to :user, foreign_key: "assa_user_id"

  validates :target_name, presence: true
  validates :deadline, presence: true

  has_one_attached :proof

  geocoded_by :target_location
  after_validation :geocode, if: :will_save_change_to_target_location?

  STATUS_OPTIONS = ['Pending', 'Accepted', 'Verify', 'Completed', 'Declined']
  validates :status, inclusion: { in: STATUS_OPTIONS }

  include PgSearch::Model
  pg_search_scope :search_by_name_location_status,
    against: [ :target_name, :target_location, :status ],
    associated_against: {
      assassin: :name
    },
    using: {
      tsearch: { prefix: true }
    }

  include PgSearch::Model
  pg_search_scope :search_by_name_location_status_detail,
    against: [ :target_name, :target_location, :status, :details ],
    using: {
      tsearch: { prefix: true }
    }
end
