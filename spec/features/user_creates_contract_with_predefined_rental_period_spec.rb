require 'rails_helper'

feature 'User creates contract with predefined rental period' do
  scenario 'successfully' do
    create :equipment, model: 'Furadeira'

    customer = create(:customer)

    visit new_contract_path

    select '5', from: 'Prazo de locação'
    select customer.name, from: 'Cliente'
    check 'Furadeira'
    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    fill_in 'Data de início', with: '12/09/2016'
    fill_in 'Valor', with: '500'
    fill_in 'Desconto', with: '10'

    click_on 'Criar contrato'

    expect(page).to have_content 'Prazo de locação'
    expect(page).to have_content '5 dias'
  end

  scenario 'successfully selects 1 day' do
    create :equipment, model: 'Furadeira'

    customer = create(:customer)

    visit new_contract_path

    select '1', from: 'Prazo de locação'
    select customer.name, from: 'Cliente'
    check 'Furadeira'
    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    fill_in 'Data de início', with: '12/09/2016'
    fill_in 'Valor', with: '500'
    fill_in 'Desconto', with: '10'

    click_on 'Criar contrato'

    expect(page).to have_content 'Prazo de locação'
    expect(page).to have_content '1 dia'
  end

  scenario 'do not select a rental period' do
    create :equipment, model: 'Furadeira'

    customer = create(:customer)

    visit new_contract_path

    select customer.name, from: 'Cliente'
    check 'Furadeira'
    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    fill_in 'Data de início', with: '12/09/2016'
    fill_in 'Valor', with: '500'
    fill_in 'Desconto', with: '10'

    click_on 'Criar contrato'

    expect(page).to have_content 'Você não preencheu alguns campos necessários.'
    expect(page).to have_content 'O Prazo de locação é obrigatório'
  end
end
