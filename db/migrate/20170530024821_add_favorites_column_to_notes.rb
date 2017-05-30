class AddFavoritesColumnToNotes < ActiveRecord::Migration[5.1]
  def change
    add_reference :notes, :favorite, foreign_key: true
  end
end
