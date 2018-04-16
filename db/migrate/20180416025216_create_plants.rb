class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :title
      t.text :description
      t.string :photo
      t.text :care
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
