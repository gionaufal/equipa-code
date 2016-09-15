class AddPriceFloatToPrice < ActiveRecord::Migration[5.0]
  def change
    add_column :prices, :price, :float
  end
end
