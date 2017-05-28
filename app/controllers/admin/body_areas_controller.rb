class Admin::BodyAreasController < ApplicationController
  def new
    @body_area = BodyArea.new
  end

  def create
    @body_area = BodyArea.new(body_area_params)
    if @body_area.save
      redirect_to body_areas_path, alert: "#{@body_area.name} has been created!"
    else
      # write sad path test and instructions
    end
  end

  private

  def body_area_params
    params.require(:body_area).permit(:name)
  end
end
