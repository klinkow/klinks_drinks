class RenameQuantity < ActiveRecord::Migration[5.0]
  def change
    drop_table(:quantity)

    create_table(:quantities) do |t|
      t.column(:drink_id, :integer)
      t.column(:ingredient_id, :integer)
      t.column(:quantity, :string)
    end
  end
end
