class AddCostAndTypeToPlants < ActiveRecord::Migration[5.1]
  def change
    add_column :plants, :cost, :integer
    add_column :plants, :plant_type, :string
  end
end
