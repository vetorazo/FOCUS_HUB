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
    @blackout = Booking.new
  end
end
