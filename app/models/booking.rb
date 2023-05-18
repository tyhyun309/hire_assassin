class Booking < ApplicationRecord
  belongs_to :assassin
  belongs_to :user

  validates :target_name, presence: true
  validates :deadline, presence: true

  has_one_attached :proof

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
