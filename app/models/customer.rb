class Customer < ApplicationRecord
  validates :name, :billing_address, :phone, :mail, :cnpj, presence: true
end
