class Admin::StretchesController < ApplicationController
  before_action :require_admin

  def new
    @stretch = Stretch.new
    @body_area = BodyArea.all
  end

  def create
    @stretch = Stretch.new(stretch_params)
    if @stretch.save
      redirect_to admin_path(:current_user), alert: "#{@stretch.name} has been created!"
    else
      # create sad path test
    end
  end

  def edit
    @stretch = Stretch.find(params[:id])
  end

  def update
    @stretch = Stretch.find(params[:id])
    @stretch.update(stretch_params)
    redirect_to stretch_path(@stretch)
  end

  def destroy
    @stretch = Stretch.find(params[:id])
    @stretch.destroy
    redirect_to stretches_path
  end

  private

  def stretch_params
    params.require(:stretch).permit(:name, :description, :picture)
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
