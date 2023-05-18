class Assassin < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :name, presence: true
  validates :price, presence: true
  validates :photo, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_weapon_description,
    against: [ :name, :weapon, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
