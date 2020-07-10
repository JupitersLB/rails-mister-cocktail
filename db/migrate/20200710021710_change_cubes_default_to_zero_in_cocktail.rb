class ChangeCubesDefaultToZeroInCocktail < ActiveRecord::Migration[6.0]
  def change
    change_column_null :cocktails, :cubes, 0
  end
end
