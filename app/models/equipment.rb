class Equipment < ApplicationRecord
  belongs_to :category
  validates :category_id, :model, :serial_number, :asset_number, 
            :acquisition_price, presence: true
end
