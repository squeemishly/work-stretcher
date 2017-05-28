class Admin::BodyAreasController < ApplicationController
  before_action :require_admin

  def new
    @body_area = BodyArea.new
  end

  def create
    @body_area = BodyArea.new(body_area_params)
    if @body_area.save
      redirect_to body_areas_path, alert: "#{@body_area.name} has been created!"
    else
      redirect_to new_admin_body_area_path, alert: "You could not create a body area. Please try again."
    end
  end

  private

  def body_area_params
    params.require(:body_area).permit(:name)
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
