class RemoveDaysAndPriceFromCategory < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :days, :integer
    remove_column :categories, :price, :integer
  end
end
