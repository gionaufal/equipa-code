class Contract < ApplicationRecord
  belongs_to :customer
  validates :equipment, :delivery_address, :responsable, :rental_period, :initial_date, :amount, presence: true
end
