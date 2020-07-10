class AddDefaultValueToCubesInCocktail < ActiveRecord::Migration[6.0]
  def change
    change_column_default :cocktails, :cubes, 0
  end
end
