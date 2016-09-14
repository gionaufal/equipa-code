class Equipment < ApplicationRecord
  belongs_to :category
  has_many :rented_equipments
  has_many :contracts, through: :rented_equipments
  validates :category_id, :model, :serial_number, :asset_number,
            :acquisition_price, presence: true
end
