class Budget < ApplicationRecord
  validates :name, :mail, :phone, :body, presence: true
end
