class Contract < ApplicationRecord
  has_one :receipt
  has_one :return_receipt
  has_many :rented_equipments
  has_many :equipment, through: :rented_equipments
  belongs_to :customer
  validates :equipment, :delivery_address, :responsable, :rental_period,
            :initial_date, presence: true
  before_save :calculate_return_date, :calculate_amount

  def calculate_amount
    self.amount = 0
    equipment.map do |equip|
      self.amount += equip.category.prices.find_by(days: rental_period).price
    end
    self.amount = (self.amount * (1 - (discount / 100))) if discount
  end

  def calculate_return_date
    self.return_date = initial_date.to_date + rental_period.to_i
  end

  def rental_period_days
    rental_period == 1 ? "#{rental_period} dia" : "#{rental_period} dias"
  end
end
