class LensesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:query].present?
      @lenses = Lens.search_by_brand_model_or_description(params[:query])
    else
      @lenses = Lens.all
    end
  end
end
