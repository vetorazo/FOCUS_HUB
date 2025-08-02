class LensesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_lens, only: :show

  def index
    if params[:query].present?
      @lenses = Lens.search_by_brand_model_or_description(params[:query]).order(:brand, :model)
    else
      @lenses = Lens.all.order(:brand, :model)
    end
  end

  def show
    @listings = @lens.listings
  end

  private

  def set_lens
    @lens = Lens.find(params[:id])
  end
end
