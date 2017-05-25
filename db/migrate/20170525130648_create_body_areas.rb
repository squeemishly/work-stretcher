class CreateBodyAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :body_areas do |t|
      t.string :name
    end
  end
end
