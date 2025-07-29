class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @lens = Lens.find(params[:lens_id])
    @listings = Listing.where(lens_id: @lens.id)
  end

  def show
    @listing = Listing.find(params[:id])
    @reviews = @listing.reviews.includes(:user)
    @review = @listing.reviews.new
    @booking = Booking.new
    @lens = @listing.lens
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user

    if @listing.save
      redirect_to lens_listings_path(@listing.lens), notice: "Listing created successfully."
    else
      render :new, notice: "Failed to create listing."
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:owner_description, :daily_rate, :lens_id, photos: [])
  end
end
