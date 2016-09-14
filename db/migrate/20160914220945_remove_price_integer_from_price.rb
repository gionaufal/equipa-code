class RemovePriceIntegerFromPrice < ActiveRecord::Migration[5.0]
  def change
    remove_column :prices, :price, :integer
  end
end
