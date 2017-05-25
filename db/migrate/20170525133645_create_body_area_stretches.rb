class CreateBodyAreaStretches < ActiveRecord::Migration[5.1]
  def change
    create_table :body_area_stretches do |t|
      t.references :body_area, foreign_key: true
      t.references :stretch, foreign_key: true

      t.timestamps
    end
  end
end
