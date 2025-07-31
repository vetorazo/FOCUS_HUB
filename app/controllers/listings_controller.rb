class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @lens = Lens.find(params[:lens_id])
    @listings = Listing.where(lens_id: @lens.id)
  end

  def show
    @listing = Listing.find(params[:id])
    @current_user_is_owner = @listing.user == current_user
    @reviews = @listing.reviews.includes(:user)
    @review = @listing.reviews.new
    @booking = Booking.new
    @lens = @listing.lens
    @blackout = Booking.new
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user

    if @listing.save
      redirect_to listing_path(@listing), notice: "Listing created successfully."
    else
      render :new, status: :unprocessable_entity, notice: "Failed to create listing."
    end
  end

  def booked_dates
    @listing = Listing.find(params[:id])
    current_bookings = @listing.bookings.where("start_date >= ?", Date.today)
    @current_booking_dates = current_bookings.map do |booking|
      {
        from: booking.start_date.to_s,
        to: booking.end_date.to_s
      }
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:owner_description, :daily_rate, :lens_id, photos: [])
  end
end
