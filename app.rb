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

post('/drinks/:id') do
  @drink = Drink.new({:name => params.fetch('new_drink_name'), :instructions => params.fetch('new_drink_instructions'), :description => params.fetch('new_drink_description')})
  @drink.save()
  @drinks = Drink.all()
  erb(:drinks)
end
