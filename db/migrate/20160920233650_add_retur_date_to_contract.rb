class AddReturDateToContract < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :return_date, :date
  end
end
