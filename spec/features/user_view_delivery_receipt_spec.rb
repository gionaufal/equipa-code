require 'rails_helper'

feature 'User view delivery receipt' do

  scenario 'receipt already issued' do
    date = DateTime.new(2016,01,13)
    equipment = create(:equipment)
    contract = create(:contract, equipment: [equipment])
    receipt = create(:receipt, contract: contract, created_at: date)
    visit contract_path contract

    click_link 'Visualizar recibo'

    expect(page).to have_css("h1", text: "Recibo de Entrega")
    expect(page).to have_content '13 de Janeiro de 2016'
    expect(page).to have_content contract.responsable
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.initial_date
    expect(page).to have_content 'Assinatura do Responsável'

  end

  scenario 'contract without receipt' do
    date = DateTime.new(2016,01,13)
    equipment = create(:equipment)
    contract = create(:contract, equipment: [equipment])
    visit contract_path contract

    click_link 'Emitir recibo'

    expect(page).to have_css("h1", text: "Recibo de Entrega")
    expect(page).to have_content contract.responsable
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.initial_date
    expect(page).to have_content 'Assinatura do Responsável'
  end
end
