class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :model
      t.integer :serial_number
      t.integer :asset_number
      t.float :acquisition_price
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
