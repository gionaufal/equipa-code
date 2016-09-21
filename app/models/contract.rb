class Contract < ApplicationRecord
  has_one :receipt
  has_one :return_receipt
  has_many :rented_equipments
  has_many :equipment, through: :rented_equipments
  belongs_to :customer
  validates :equipment, :delivery_address, :responsable, :rental_period,
            :initial_date, :amount, presence: true

  before_save :calculate_return_date

  def calculate_return_date
    self.return_date = initial_date.to_date + rental_period.to_i
  end

  def rental_period_days
    rental_period == 1 ? "#{rental_period} dia" : "#{rental_period} dias"
  end
end
