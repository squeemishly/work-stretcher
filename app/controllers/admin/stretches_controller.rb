class Admin::StretchesController < ApplicationController
  before_action :require_admin

  def new
    @stretch = Stretch.new
  end

  def create
    @stretch = Stretch.new(stretch_params)
    if @stretch.save
      redirect_to admin_path(:current_user), alert: "#{@stretch.name} has been created!"
    else
      redirect_to new_admin_stretch_path, alert: "You cannot create that stretch without all the relevent information. Please try again."
    end
  end

  def edit
    @stretch = Stretch.find(params[:id])
  end

  def update
    @stretch = Stretch.find(params[:id])
    if @stretch.update(stretch_params)
      redirect_to stretch_path(@stretch)
    else
      redirect_to edit_admin_stretch_path(@stretch), alert: "You must fill in all information to edit this stretch."
    end
  end

  def destroy
    @stretch = Stretch.find(params[:id])
    @stretch.destroy
    redirect_to stretches_path
  end

  private

  def stretch_params
    params.require(:stretch).permit(:name, :description, :picture, body_area_ids:[])
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
