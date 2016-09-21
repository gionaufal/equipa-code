class Contract < ApplicationRecord
  has_one :receipt
  has_one :return_receipt
  has_many :rented_equipments
  has_many :equipment, through: :rented_equipments
  belongs_to :customer
  validates :equipment, :delivery_address, :responsable, :rental_period,
            :initial_date, :amount, presence: true

  def calculate_return_date
    self.initial_date.to_date + self.rental_period.to_i
  end
end
