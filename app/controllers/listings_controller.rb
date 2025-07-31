class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:lens_id]
      @lens = Lens.find(params[:lens_id])
      @listings = @lens.listings
    else
      @listings = Listing.where(user: current_user)
    end
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
      redirect_to listing_path(@listing), notice: "Listing created successfully."
    else
      render :new, status: :unprocessable_entity, notice: "Failed to create listing."
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:owner_description, :daily_rate, :lens_id, photos: [])
  end
end
