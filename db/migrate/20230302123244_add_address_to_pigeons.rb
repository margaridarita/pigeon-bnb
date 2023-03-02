class AddAddressToPigeons < ActiveRecord::Migration[7.0]
  def change
    add_column :pigeons, :address, :string
  end
end
