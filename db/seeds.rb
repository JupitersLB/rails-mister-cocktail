# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_seralised = open(url).read
ingredients = JSON.parse(ingredients_seralised)

puts 'Deleting all ingredients in the database'
Ingredient.destroy_all

puts 'Creating database'

25.times do
  ingredient = Ingredient.new(name: ingredients['drinks'][rand(0..100)]['strIngredient1'])
  puts "Created #{ingredient.name}"
  ingredient.save
end

puts 'Finished database'
