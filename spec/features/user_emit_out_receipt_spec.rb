require 'rails_helper'

feature 'User emit receipt out' do
  scenario 'successfully out' do
    visit new_receipt_path

    fill_in 'Tipo', with: 'Saida'
    fill_in 'Contrato', with: '123456789'
    fill_in 'Equipamentos', with: 'Furadeira'
    fill_in 'Endereço', with: 'Rua teste'
    fill_in 'Data de entrega', with: '09/12/2016'
    fill_in 'Assinatura', with: ''

    click_on 'Criar orçamento'

    expect(page).to have_content '123456789'
    expect(page).to have_content 'Furadeira'
    expect(page).to have_content 'Rua teste'
    expect(page).to have_content '09/12/2016'
    expect(page).to have_content ''

  end
end
