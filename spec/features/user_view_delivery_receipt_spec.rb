require 'rails_helper'

feature 'User view delivery receipt' do

  scenario 'receipt already issued' do
    contract = create(:contract)
    receipt = create(:receipt, contract: contract)
    visit contract_path contract

    click_link 'Visualizar recibo'

    expect(page).to have_css("h1", text: "Recibo de Entrega")
    expect(page).to have_content contract.responsable
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.created_at
    expect(page).to have_content 'Assinatura do Responsável'

  end

  scenario 'contract without receipt' do
    contract = create(:contract)
    visit contract_path contract

    click_link 'Emitir recibo'

    expect(page).to have_css("h1", text: "Recibo de Entrega")
    expect(page).to have_content contract.responsable
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.created_at
    expect(page).to have_content 'Assinatura do Responsável'
  end
end
