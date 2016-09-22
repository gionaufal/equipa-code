require 'rails_helper'

RSpec.describe :contract, type: :model do
  describe '#list_only_with_price' do
    it 'successfully with basic lists' do
      category = create(:category, name: 'Furadeira')
      create :price, days: 1, price: 10, category: category
      equip = create :equipment, model: 'Makita', category: category

      equipment = Equipment.list_only_with_price
      expect(equipment).to include(equip)

    end

    it 'successfully having no showing equipment' do
      category = create(:category, name: 'Furadeira')
      category_without_price = create :category, name: 'Betoneira'
      create :price, days: 1, price: 10, category: category
      equip = create :equipment, model: 'Makita', category: category
      equip_without_price = create :equipment, category: category_without_price

      equipment = Equipment.list_only_with_price
      expect(equipment).to include(equip)
      expect(equipment).not_to include(equip_without_price)
    end
  end
end
