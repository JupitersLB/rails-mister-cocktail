class Dose < ApplicationRecord
  validates :description, :ingredient, :cocktail, presence: true
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }
  belongs_to :ingredient
  belongs_to :cocktail
end

