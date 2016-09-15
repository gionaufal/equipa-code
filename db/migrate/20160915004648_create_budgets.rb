class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.string :name
      t.string :phone
      t.string :mail
      t.text :body

      t.timestamps
    end
  end
end
