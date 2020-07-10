class AddVotedToCocktail < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :voted, :boolean, default: false
  end
end
