class BodyAreasController < ApplicationController
  def show
    @body_area = BodyArea.find_by(name: params[:stretch_search])
  end
end
