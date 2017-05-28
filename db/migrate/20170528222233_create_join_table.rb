class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :stretch, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
