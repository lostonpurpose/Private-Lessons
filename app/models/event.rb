class Event < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :title, presence: true
  validates start_date, presence: true
  validates end_date, presence: true
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
end
