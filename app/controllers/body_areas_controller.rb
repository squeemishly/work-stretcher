class BodyAreasController < ApplicationController
  def show
    params[:id] = BodyArea.find_by(name: params[:stretch_search]).id if params[:stretch_search]
    @body_area = BodyArea.find(params[:id])
    @stretches = @body_area.stretches.order(:name)
  end

  def index
    @body_areas = BodyArea.all
  end
end
