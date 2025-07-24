class Review < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :content, presence: true, length: {minimum: 10}
  validates :rating, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 5}
end
