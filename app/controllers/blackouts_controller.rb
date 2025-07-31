class BlackoutsController < ApplicationController
  before_action :set_listing

  def create
    @blackout = Booking.new(blackout_params)
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

  def blackout_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
