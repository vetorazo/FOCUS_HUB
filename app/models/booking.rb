class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :start_date, :end_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_in_the_past
  validate :booking_date_cannot_be_reverse
  # validate :booking_date_cannot_overlap

  scope :upcoming, -> { where("start_date >= ?", Date.today) }

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end

  def booking_date_cannot_be_reverse
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, "can't be before start date")
    end
  end

  # def booking_date_cannot_overlap
  #   buffer_days = 1
  #   overlapped_bookings = Booking.where(listing_id: listing_id)
  #                                .where.not(id: id)
  #                                .where("start_date < ? OR end_date > ?", end_date + buffer_days, start_date - buffer_days)

  #   if overlapped_bookings.exists?
  #     errors.add(:start_date, "overlaps or is too close to another rental period.")
  #     errors.add(:end_date, "overlaps or is too close to another rental period.")
  #   end
  # end

  enum :status, { reserved: "reserved",
                  confirmed: "confirmed",
                  delivered: "delivered",
                  returned: "returned",
                  blockouted: "blockouted" }, default: :reserved
end
