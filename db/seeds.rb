require 'open-uri'
require 'json'

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

ingredient_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_raw_json = open(ingredient_url).read
ingredient_results = JSON.parse(ingredient_raw_json)
ingredient_arr = ingredient_results['drinks']

ingredient_arr.each do |hash|
  Ingredient.create(name: hash['strIngredient1'])
end

# 5.times do
#   # results[0]['strDrinkThumb'] -> img url
#   # results[0]['strDrink']
#   cocktail_url = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
#   cocktail_raw_json = open(cocktail_url).read
#   cocktail_results = JSON.parse(cocktail_raw_json)
#   Cocktail.create(name: cocktail_results[0]['strDrink'])
# end
