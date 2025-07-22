class ListingsController < ApplicationController
  def index
    @len = Len.find(params[:len_id])
    @listings = Listing.where(len_id: @len.id)
  end

  def show
    @listing = Listing.find(params[:id])
  end
end
