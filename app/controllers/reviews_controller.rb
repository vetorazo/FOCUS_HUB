class ReviewsController < ApplicationController
  before_action :set_listing

  def new
    @review = @listing.reviews.new
  end

  def create
    @review = @listing.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to listing_path(@listing)
    else
      @reviews = @listing.reviews.all
      render "listings/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end
end
