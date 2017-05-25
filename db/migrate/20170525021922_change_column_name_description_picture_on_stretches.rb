class ChangeColumnNameDescriptionPictureOnStretches < ActiveRecord::Migration[5.1]
  def change
    change_column :stretches, :name, :string, null: false
    change_column :stretches, :description, :string, null: false
    change_column :stretches, :picture, :string, null: false
  end
end
