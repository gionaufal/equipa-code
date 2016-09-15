class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :billing_address
      t.string :mail
      t.string :phone
      t.string :cnpj

      t.timestamps
    end
  end
end
