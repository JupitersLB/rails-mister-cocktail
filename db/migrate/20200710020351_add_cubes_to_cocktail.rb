class AddCubesToCocktail < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :cubes, :integer
  end
end
