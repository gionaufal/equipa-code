require 'rails_helper'

RSpec.describe :contract, type: :model do
  describe '#calculate_price' do
    it 'successfully with one equipement' do
      category = create_category_and_price

      equipment = create :equipment, model: 'Makita', category: category

      contract = build(:contract, equipment: [equipment], rental_period: 1)
      contract.calculate_amount
      expect(contract.amount).to eq(10)
    end

    it 'successfully with many equipement' do
      category = create_category_and_price

      equipment = create :equipment, model: 'Black&Decker', category: category
      equipment2 = create :equipment, model: 'Makita', category: category
      equipment3 = create :equipment, model: 'Bosch', category: category

      contract = build(:contract, equipment: [equipment,
                                              equipment2,
                                              equipment3], rental_period: 3)
      contract.calculate_amount
      expect(contract.amount).to eq(90)
    end
  end

  private

  def create_category_and_price
    category = create(:category, name: 'Furadeira')
    create :price, days: 1, price: 10, category: category
    create :price, days: 3, price: 30, category: category
    category
  end
end
