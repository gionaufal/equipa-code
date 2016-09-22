class Price < ApplicationRecord
  belongs_to :category
  validates :price, :category_id, :days, presence: true
end
