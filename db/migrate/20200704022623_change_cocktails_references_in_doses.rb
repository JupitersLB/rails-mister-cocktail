class ChangeCocktailsReferencesInDoses < ActiveRecord::Migration[6.0]
  def change
    rename_column :doses, :cocktails_id, :cocktail_id
  end
end
