class Booking < ApplicationRecord
  belongs_to :assassin
  belongs_to :user

  validates :target_name, presence: true
  validates :deadline, presence: true

  has_one_attached :proof

  geocoded_by :target_location
  after_validation :geocode, if: :will_save_change_to_target_location?

  STATUS_OPTIONS = ['Pending', 'Accepted', 'Verify', 'Completed', 'Declined']
  validates :status, inclusion: { in: STATUS_OPTIONS }
end
