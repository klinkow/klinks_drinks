class CreateDrinks < ActiveRecord::Migration[5.0]
  def change
    create_table(:drinks) do |t|
      t.column(:name, :string)
      t.column(:description, :string)
      t.column(:instructions, :string)
    end

    create_table(:quantity) do |t|
      t.column(:drink_id, :integer)
      t.column(:ingredient_id, :integer)
      t.column(:quantity, :string)
    end

    create_table(:ingredients) do |t|
      t.column(:name, :string)
      t.column(:description, :string)
    end
  end
end
