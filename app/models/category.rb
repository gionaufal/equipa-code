class Category < ApplicationRecord
  has_many :prices
  has_many :equipment
end
