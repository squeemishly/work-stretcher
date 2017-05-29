class FavoritesController < ApplicationController
  def create
    favorite = Favorite.create(stretch_id: params[:stretch_id], user_id: params[:user_id])
    # stretch = Stretch.find(params[:stretch_id])
    # flash.alert = "#{stretch.name} has been added to your favorites!"
    # Get the flash message to work.
    # Figure out how to test to make sure you can't favorite the same thing 2 times
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to user_path(current_user)
  end
end
