class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :lens
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  validates :owner_description, presence: true, length: { minimum: 10 }
  validates :daily_rate, presence: true, numericality: { greater_than: 0 }
  validates :lens_id, presence: true

  has_many :bookings
end
