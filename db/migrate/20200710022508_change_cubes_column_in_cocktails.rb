class ChangeCubesColumnInCocktails < ActiveRecord::Migration[6.0]
  def change
    change_column :cocktails, :cubes, :integer, :default => 0
  end
end
