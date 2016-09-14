class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :price
      t.integer :days

      t.timestamps
    end
  end
end
