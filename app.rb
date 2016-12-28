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
  if params.fetch('new_drink_name') == ""
    new_drink_name = @drink.name
  else
    new_drink_name = params.fetch('new_drink_name')
  end
  if params.fetch('new_drink_instructions') == ""
    new_drink_instructions = @drink.instructions
  else
    new_drink_instructions = params.fetch('new_drink_instructions')
  end
  if params.fetch('new_drink_description') == ""
    new_drink_description = @drink.description
  else
    new_drink_description = params.fetch('new_drink_description')
  end
  @drink.update({:name => new_drink_name, :instructions => new_drink_instructions, :description => new_drink_description})
  ingredient_id = params.fetch('new_ingredient') rescue nil
  if ingredient_id != nil
    ingredient_id = ingredient_id.to_i
    quantity = params.fetch('new_quantity')
    Quantity.create({:drink_id => @drink.id, :ingredient_id => ingredient_id, :quantity => quantity})
  end
  @drinks = Drink.all()
  erb(:drinks)
end

get('/drink/:id') do
  @drink = Drink.find(params.fetch('id'))
  @ingredients = Ingredient.all
  @quantities = Quantity.all
  erb(:drink)
end

get('/ingredients') do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

delete('/ingredients') do
  @ingredient = Ingredient.find(params.fetch('ingredient_id'))
  @ingredient.delete()
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post('/ingredients/:id') do
  @ingredient = Ingredient.new({:name => params.fetch('new_ingredient_name'), :description => params.fetch('new_ingredient_description')})
  @ingredient.save()
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

get('/ingredient/:id') do
  @ingredient = Ingredient.find(params.fetch('id').to_i)
  erb(:ingredient)
end

  # Quantity.find_by drink_id: test_drink.id(), ingredient_id: )
