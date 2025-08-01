class BlackoutsController < ApplicationController
  before_action :set_listing

  def create
    date_range = params[:booking][:start_date].split(" to ")
    @blackout = Booking.new(start_date: date_range[0], end_date: date_range[1])
    @blackout.listing = @listing
    @blackout.user = current_user
    @blackout.total_price = 0
    @blackout.blackout = true
    @blackout.status = :blockouted

    if @blackout.save
      redirect_to @listing, notice: "Lens blockouted successfully!"
    else
      @reviews = @listing.reviews.all
      @review = @listing.reviews.new
      @booking = Booking.new
      render "listings/show", status: :unprocessable_entity
    end
  end

  private
  def set_listing
    @listing = Listing.find(params[:listing_id])
  end
end
