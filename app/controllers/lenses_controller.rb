class LensesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @lenses = Lens.all
  end
end
