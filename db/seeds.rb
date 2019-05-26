require 'json'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying"
Cocktail.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks_list = open(url).read
drinks = JSON.parse(drinks_list)
drinks["drinks"].each do |drink|
  ingredient_list = Ingredient.new(name: drink["strIngredient1"])
  ingredient_list.save!
end
puts "Finished!"
