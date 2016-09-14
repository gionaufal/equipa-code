class Contract < ApplicationRecord
  has_many :equipment, through: :locations
end
