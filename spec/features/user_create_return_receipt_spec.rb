require 'rails_helper'

feature 'User creates return receipt' do
  scenario 'successfully' do
    equipment = create :equipment
    contract = create :contract, equipment: [equipment]

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
    equipment1 = create :equipment, model: 'Furadeira'
    equipment2 = create :equipment, model: 'Frigideira'
    contract = create :contract, equipment: [equipment1, equipment2]

    visit contract_path(contract)

    click_on 'Emitir recibo de devolução'

    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content 'Furadeira'
    expect(page).to have_content 'Frigideira'

    fill_in 'CPF', with: '0000000'
    fill_in 'Nome do funcionário', with: 'Douglas'

    click_on 'Emitir recibo'

    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content 'Furadeira'
    expect(page).to have_content 'Frigideira'
    expect(page).to have_content '0000000'
    expect(page).to have_content 'Douglas'
  end

  scenario 'fails to fill' do
    equipment = create :equipment
    contract = create :contract, equipment: [equipment]

    visit contract_path(contract)

    click_on 'Emitir recibo de devolução'

    click_on 'Emitir recibo'

    expect(page).to have_content 'Preencha os dados do funcionário'
  end
end
