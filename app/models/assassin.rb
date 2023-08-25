class Assassin < ApplicationRecord
  self.table_name = "assa_assassins"
  belongs_to :user, foreign_key: "assa_user_id"
  has_many :bookings, foreign_key: "assa_assassin_id"
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
