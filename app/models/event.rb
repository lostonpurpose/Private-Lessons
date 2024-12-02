class Event < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many_attached :photos
  has_one_attached :video

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price, presence: true
  validates :capacity, presence: true
  validates :location, presence: true

  monetize :price_cents
end
