class BookingsController < ApplicationController
  before_action :set_listing

  def create
    # Get the start date as the string out
    date_range = params[:booking][:start_date].split(" to ")
    @booking = Booking.new(start_date: date_range[0], end_date: date_range[1])
    # Seperate the start date and end date
    # Assign each of them to @booking.start_date & end_date
    # Create a booking
    @booking.listing = @listing
    @booking.user = current_user
    @booking.total_price = calculate_total_price

    if @booking.save
      redirect_to @listing, notice: "Lens booked successfully!"
    else
      @reviews = @listing.reviews.all
      @review = @listing.reviews.new
      @blackout = Booking.new
      render "listings/show", status: :unprocessable_entity
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def calculate_total_price
    number_of_days = (@booking.end_date - @booking.start_date)
    return 1 if number_of_days.zero?

    number_of_days * @listing.daily_rate
  end
end
