class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  has_many :comments, dependent: :destroy
  has_many_attached :photos
  belongs_to :event, optional: true
end
