class ChangeSerialNumberFromEquipmentToString < ActiveRecord::Migration[5.0]
  def change
    change_column :equipment, :serial_number, :string
  end
end
