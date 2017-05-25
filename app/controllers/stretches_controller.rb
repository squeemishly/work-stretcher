class StretchesController < ApplicationController
  def index
    @stretches = Stretch.all
    @body_areas = BodyArea.all
  end

  def show
    @stretch = Stretch.find(params[:id])
  end
end
