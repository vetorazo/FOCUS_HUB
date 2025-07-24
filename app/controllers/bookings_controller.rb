class BookingsController < ApplicationController
  before_action :set_listing

  def new
    @booking = @listing.bookings.new
  end

  def create
    @booking = @listings.bookings.new(booking_params)
    @booking.user = current_user
    @booking.total_price = calculate_total_price
    @booking.status = "pending"

    if @booking.save
      redirect_to @listing, notice: "Lens booked successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_listing
    @listings = Listing.find(params[:listing_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def calculate_total_price
    number_of_days = (@booking.end_date - @booking.start_date).total_price
    number_of_days * @listing.daily_rate
  end
end
