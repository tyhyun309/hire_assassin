class User < ApplicationRecord
  self.table_name = "assa_users"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :assassin, foreign_key: 'assa_user_id'
  has_many :bookings, foreign_key: 'assa_user_id'
  has_many :bookings_as_assassin, through: :assassin, source: :bookings, foreign_key: 'assa_user_id'
end
