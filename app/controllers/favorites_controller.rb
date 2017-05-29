class FavoritesController < ApplicationController
  def create
    favorite = Favorite.create(stretch_id: params[:stretch_id], user_id: params[:user_id])
  end
end
