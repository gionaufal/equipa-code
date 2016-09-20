class Contract < ApplicationRecord
  has_one :receipt
  has_one :return_receipt
  has_many :rented_equipments
  has_many :equipment, through: :rented_equipments
  belongs_to :customer
  validates :equipment, :delivery_address, :responsable, :rental_period,
            :initial_date, :amount, presence: true
end
