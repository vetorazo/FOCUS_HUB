class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :lens

  validates :owner_description, presence: true, length: { minimum: 10 }
  validates :daily_rate, presence: true, numericality: { greater_than: 0 }

  has_many :bookings
end
