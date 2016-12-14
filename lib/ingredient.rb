class Ingredient < ActiveRecord::Base
  has_many :quantities
  has_many :drinks, through: :quantities
end
