class ChangeNotesColumnOnFavorites < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :notes
  end
end
