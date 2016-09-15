require 'rails_helper'

feature 'User emit delivered receipt' do
  scenario 'create contract with receipt' do
    contract = create(:contract)
    receipt = create(:receipt, contract: contract)
    visit contract_path contract

    expect(page).to have_link('Visualizar recibo')

    expect(page).to have_css("h1", text: "Recibo de Entrega")
    expect(page).to have_content contract.responsable
    expect(page).to have_content contract.delivery_address

  end

  scenario 'create contract without receipt' do
    contract = create(:contract)
    visit contract_path contract

    expect(page).to have_link('Emitir recibo')
  end
end
