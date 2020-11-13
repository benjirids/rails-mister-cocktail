# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 20.times do
#   Ingredient.create!(name: Faker::Movies::LordOfTheRings.character)
# end

require 'open-uri'
require 'json'
url = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
json = JSON.parse(url.read)
json['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
  puts "Creating ingredient"
end
puts "Finished"
