class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :state, presence: true # pending, paid, cancelled
end
