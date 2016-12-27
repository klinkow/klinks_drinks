require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/drinks') do
  @drinks = Drink.all()
  erb(:drinks)
end

delete('/drinks') do
  @drink = Drink.find(params.fetch('drink_id'))
  @drink.delete()
  @drinks = Drink.all()
  erb(:drinks)
end

post('/drinks/:id') do
  @drink = Drink.new({:name => params.fetch('new_drink_name'), :instructions => params.fetch('new_drink_instructions'), :description => params.fetch('new_drink_description')})
  @drink.save()
  @drinks = Drink.all()
  erb(:drinks)
end

patch('/drinks/:id') do
  @drink = Drink.find(params.fetch('id'))
  @drink.update({:name => params.fetch('new_drink_name'), :instructions => params.fetch('new_drink_instructions'), :description => params.fetch('new_drink_description')})
  @drink.ingredients.create(:name => params.fetch('new_ingredient'))
  @drink.save()
  quantity = Quantity.find_by(drink_id: @drink.id)
  quantity.update(:quantity => params.fetch('new_quantity'))
  @drinks = Drink.all()
  erb(:drinks)
end

get('/drink/:id') do
  @drink = Drink.find(params.fetch('id'))
  @ingredients = Ingredient.all
  erb(:drink)
end

get('/ingredients') do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post('/ingredients/:id') do
  @ingredient = Ingredient.new({:name => params.fetch('new_ingredient_name'), :description => params.fetch('new_ingredient_description')})
  @ingredient.save()
  @ingredients = Ingredient.all()
  erb(:ingredients)
end


  # Quantity.find_by drink_id: test_drink.id(), ingredient_id: )
