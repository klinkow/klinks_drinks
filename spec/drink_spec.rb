require('spec_helper')

describe(Drink) do

  it('has many ingredients through quantities') do
    test_drink = Drink.create({:name => "Screwdriver"})
    test_ingredient = Ingredient.create({:name => "Orange Juice"})
    test_ingredient2 = Ingredient.create({:name => "Vodka"})
    test_drink.ingredients.push(test_ingredient, test_ingredient2)
    (Quantity.find_by drink_id: test_drink.id()).update({:quantity => "2 oz."})
    expect(test_drink.ingredients()).to(eq([test_ingredient, test_ingredient2]))
  end

end
