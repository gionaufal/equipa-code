require 'rails_helper'

feature 'User creates return receipt' do
  scenario 'successfully' do
    equipment = create :equipment
    contract = create :contract, equipment: [equipment]
    
    visit contract_path(contract)

    click_on 'Emitir recibo de devolução'

    expect(page).to have_content contract.company.name
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.equipment.first.model

    fill_in 'CPF', with: '0000000'
    fill_in 'Nome do funcionário', with: 'Douglas'

    click_on 'Emitir recibo'

    expect(page).to have_content contract.company.name
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.equipment.first.model
    expect(page).to have_content '0000000'
    expect(page).to have_content 'Douglas'
  end
end
