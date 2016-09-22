class Category < ApplicationRecord
  has_many :prices
  has_many :equipment

  def current_prices
    
  end
end
