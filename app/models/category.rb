class Category < ApplicationRecord
  has_many :prices
  has_many :equipment

  def current_prices
    prices = []
    RentalPeriod::DAYS.each do |day|
      price = self.prices.where(category_id: self.id, days: day).last
      prices << price if price
    end
    prices
  end
end
