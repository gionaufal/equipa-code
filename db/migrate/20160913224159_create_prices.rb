class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.integer :days
      t.integer :price
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
