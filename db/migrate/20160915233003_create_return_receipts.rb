class CreateReturnReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :return_receipts do |t|
      t.references :contract, foreign_key: true
      t.string :cpf
      t.string :employee_name

      t.timestamps
    end
  end
end
