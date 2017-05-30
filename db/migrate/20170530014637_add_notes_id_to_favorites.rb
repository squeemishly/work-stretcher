class AddNotesIdToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_reference :favorites, :note, foreign_key: true, index: true
  end
end
