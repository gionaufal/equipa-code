class ChangeAssetNumberFromEquipmentToString < ActiveRecord::Migration[5.0]
  def change
    change_column :equipment, :asset_number, :string
  end
end
