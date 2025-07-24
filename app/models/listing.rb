class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :lens
  has_many :reviews, dependent: :destroy

  validates :owner_description, presence: true, length: { minimum: 10 }
  validates :daily_rate, presence: true, numericality: { greater_than: 0 }
end
