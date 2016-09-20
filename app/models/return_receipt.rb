class ReturnReceipt < ApplicationRecord
  belongs_to :contract
  validates :cpf, :employee_name, presence: true
end
