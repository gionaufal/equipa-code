class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.string :customer
      t.string :equipment
      t.string :acquisition_price
      t.string :delivery_address
      t.string :responsable
      t.string :cpf
      t.string :rental_period
      t.string :initial_date
      t.float :amount
      t.float :discount

      t.timestamps
    end
  end
end
