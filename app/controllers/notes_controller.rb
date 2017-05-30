class NotesController < ApplicationController
  def new
    @favorite = Favorite.find(params[:favorite_id])
    @stretch = @favorite.stretch
    @note = Note.new
  end

  def create
    favorite = Favorite.find(params[:favorite_id])
    note = Note.create!(note_params)
    favorite.update_attribute :note_id, note.id
    redirect_to user_path(current_user)
  end

  def destroy
    favorite = Favorite.find(params[:favorite_id])
    note = favorite.note
    favorite.update_attribute(:note_id, nil)
    redirect_to user_path(current_user)
  end

  def edit
    @favorite = Favorite.find(params[:favorite_id])
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to user_path(current_user)
  end

  private

  def note_params
    params.require(:note).permit(:note, :favorite_id)
  end
end
