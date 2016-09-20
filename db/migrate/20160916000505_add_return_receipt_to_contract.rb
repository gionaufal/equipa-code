class AddReturnReceiptToContract < ActiveRecord::Migration[5.0]
  def change
    add_reference :contracts, :return_receipt, foreign_key: true
  end
end
