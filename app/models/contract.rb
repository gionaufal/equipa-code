class Contract < ApplicationRecord
  has_many :rented_equipments
  has_many :equipment, through: :rented_equipments
  
end
