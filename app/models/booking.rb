class Booking < ApplicationRecord
  belongs_to :assassin
  belongs_to :user

  validates :target_name, presence: true
  validates :deadline, presence: true

  STATUS_OPTIONS = ['Pending', 'Accepted', 'Completed']
  validates :status, inclusion: { in: STATUS_OPTIONS }
end
