class Admin::StretchesController < ApplicationController
  def new
    @stretch = Stretch.new
  end

  def create
    @stretch = Stretch.new(stretch_params)
    if @stretch.save
      redirect_to admin_path(:current_user), alert: "#{@stretch.name} has been created!"
    else
      # create sad path test
    end
  end

  private

  def stretch_params
    params.require(:stretch).permit(:name, :description, :picture)
  end
end
