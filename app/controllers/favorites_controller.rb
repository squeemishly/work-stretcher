class FavoritesController < ApplicationController
  def create
    favorite = Favorite.create(stretch_id: params[:stretch_id], user_id: params[:user_id])
    # stretch = Stretch.find(params[:stretch_id])
    # flash.alert = "#{stretch.name} has been added to your favorites!"
    # Get the flash message to work.
  end
end
