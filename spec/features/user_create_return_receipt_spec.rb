require 'rails_helper'

feature 'User creates return receipt' do
  scenario 'successfully' do
    category = create(:category, name: 'Furadeira')
    create :price, days: 1, price: 10, category: category
    equipment = create :equipment, model: 'Makita', category: category
    contract = create :contract, equipment: [equipment], rental_period: 1

    visit contract_path(contract)

    click_on 'Emitir recibo de devolução'

    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.equipment.first.model

    fill_in 'CPF', with: '0000000'
    fill_in 'Nome do funcionário', with: 'Douglas'

    click_on 'Emitir recibo'

    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.equipment.first.model
    expect(page).to have_content '0000000'
    expect(page).to have_content 'Douglas'
  end

  scenario 'successfully with 2 equipment' do
    category = create(:category, name: 'Furadeira')
    create :price, days: 1, price: 10, category: category
    equipment = create :equipment, model: 'Makita', category: category
    equipment2 = create :equipment, model: 'Makita2', category: category
    contract = create :contract, equipment: [equipment, equipment2],
                                 rental_period: 1

    visit contract_path(contract)

    click_on 'Emitir recibo de devolução'

    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content 'Makita'
    expect(page).to have_content 'Makita2'

    fill_in 'CPF', with: '0000000'
    fill_in 'Nome do funcionário', with: 'Douglas'

    click_on 'Emitir recibo'

    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content 'Makita'
    expect(page).to have_content 'Makita2'
    expect(page).to have_content '0000000'
    expect(page).to have_content 'Douglas'
  end

  scenario 'fails to fill' do
    category = create(:category, name: 'Furadeira')
    create :price, days: 1, price: 10, category: category
    equipment = create :equipment, model: 'Makita', category: category
    equipment2 = create :equipment, model: 'Makita2', category: category
    contract = create :contract, equipment: [equipment, equipment2],
                                 rental_period: 1

    visit contract_path(contract)

    click_on 'Emitir recibo de devolução'

    click_on 'Emitir recibo'

    expect(page).to have_content 'Preencha os dados do funcionário'
  end
end
