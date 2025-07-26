class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :start_date, :end_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end

  enum :status, { reserved: "reserved", confirmed: "confirmed", delivered: "delivered", returned: "returned" }, default: :reserved
end
