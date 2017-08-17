# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "Destroy"

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

puts "create new DB"

ingredients = JSON.parse(open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
ingredients['drinks'].each do |i|
  Ingredient.create(name: i['strIngredient1'])
end
# Ingredient.create(name: "lemon")

cocktail = Cocktail.new(name: "Mojito")
dose = Dose.new(description: "10cl")
dose.cocktail = cocktail
dose.ingredient = Ingredient.all.sample
dose.save
dose.ingredient.save
cocktail.save
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
