class RemoveAdressToRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :adress, :string
  end
end
