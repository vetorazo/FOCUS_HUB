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
  end
end
