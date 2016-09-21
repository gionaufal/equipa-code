require 'rails_helper'

feature 'User view delivery receipt' do
  scenario 'receipt already issued' do
    date = DateTime.new(2016, 1, 13).in_time_zone('Brasilia')
    category = create(:category, name: 'Furadeira')
    create :price, days: 1, price: 10, category: category
    equipment = create :equipment, model: 'Makita', category: category
    equipment2 = create :equipment, model: 'Makita2', category: category
    contract = create :contract, equipment: [equipment, equipment2],
                                 rental_period: 1, created_at: date
    create(:receipt, contract: contract, created_at: date)
    visit contract_path contract

    click_link 'Visualizar recibo'

    expect(page).to have_css('h1', text: 'Recibo de Entrega')
    expect(page).to have_content '13 de Janeiro de 2016'
    expect(page).to have_content contract.responsable
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.initial_date
    expect(page).to have_content 'Assinatura do Responsável'
  end

  scenario 'contract without receipt' do
    category = create(:category, name: 'Furadeira')
    create :price, days: 1, price: 10, category: category
    equipment = create :equipment, model: 'Makita', category: category
    equipment2 = create :equipment, model: 'Makita2', category: category
    contract = create :contract, equipment: [equipment, equipment2],
                                 rental_period: 1
    visit contract_path contract

    click_link 'Emitir recibo'

    expect(page).to have_css('h1', text: 'Recibo de Entrega')
    expect(page).to have_content contract.responsable
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.initial_date
    expect(page).to have_content 'Assinatura do Responsável'
  end
end
