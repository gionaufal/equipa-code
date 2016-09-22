class Equipment < ApplicationRecord
  belongs_to :category
  has_many :contracts, through: :rented_equipments
  validates :category_id, :model, :serial_number, :asset_number,
            :acquisition_price, presence: true

  def self.list_only_with_price
    Equipment.joins(category: :prices).distinct
  end
end
