class Booking < ApplicationRecord
  belongs_to :assassin
  belongs_to :user

  validates :target_name, presence: true
  validates :deadline, presence: true

  has_one_attached :photo

  STATUS_OPTIONS = ['Pending', 'Accepted', 'Verify', 'Completed']
  validates :status, inclusion: { in: STATUS_OPTIONS }
end
