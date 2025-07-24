class ListingsController < ApplicationController
  def index
    @lens = Lens.find(params[:lens_id])
    @listings = Listing.where(lens_id: @lens.id)
  end

  def show
    @listing = Listing.find(params[:id])
    @reviews = @listing.reviews.includes(:user)
    @review = @listing.reviews.new
  end
end
