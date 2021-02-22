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

ingredients = Ingredient.all

10.times do
  # img url: cocktail_results['strDrinkThumb']
  rating = (0..5).to_a.sample
  cocktail_url = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
  cocktail_raw_json = open(cocktail_url).read
  cocktail_results = JSON.parse(cocktail_raw_json)['drinks'][0]
  cocktail = Cocktail.create!(name: cocktail_results['strDrink'], rating: rating)

  thumbnail = URI.open(cocktail_results['strDrinkThumb'])
  cocktail.photo.attach(io: thumbnail, filename: "#{cocktail.name}.png", content_type: 'image/png')

  Dose.create!(description: cocktail_results['strMeasure1'],
              ingredient: ingredients.sample,
              cocktail: cocktail)
  Review.create!(rating: rating, content: 'Lorem ipsum', cocktail: cocktail)
end
