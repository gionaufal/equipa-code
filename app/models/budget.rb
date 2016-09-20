class Budget < ApplicationRecord
  validates :name, :mail, :phone, :body, presence: true

  def excerpt
    "#{body.slice(0, 20)}..."
  end
end
