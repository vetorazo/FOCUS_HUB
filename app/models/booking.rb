class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :start_date, :end_date, presence: true

  enum :status, { reserved: "reserved", confirmed: "confirmed", delivered: "delivered", returned: "returned" }, default: :reserved
end
