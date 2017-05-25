class CreateStretches < ActiveRecord::Migration[5.1]
  def change
    create_table :stretches do |t|
      t.string :name
      t.string :description
      t.string :picture
    end
  end
end
