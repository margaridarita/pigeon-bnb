class AddCategoryToPigeons < ActiveRecord::Migration[7.0]
  def change
    add_column :pigeons, :category, :string
  end
end
