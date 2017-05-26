class StretchesController < ApplicationController
  def index
    @stretches = Stretch.all.order(:name)
    @body_areas = BodyArea.all
  end

  def show
    @stretch = Stretch.find(params[:id])
  end
end
