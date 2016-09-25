require 'rails_helper'

feature 'User creates contract with predefined rental period' do
  scenario 'successfully' do
    user = create(:user)
    category = create(:category, name: 'Furadeira')
    create :price, days: 5, price: 40, category: category
    create :equipment, model: 'Makita', category: category
    customer = create(:customer)
    login_as(user)

    visit new_contract_path

    select '5', from: 'Prazo de locação'
    select customer.name, from: 'Cliente'
    check 'Makita'
    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    fill_in 'Data de início', with: '12/09/2016'
    fill_in 'Desconto', with: '10'

    click_on 'Criar contrato'

    expect(page).to have_content 'Prazo de locação'
    expect(page).to have_content '5 dias'
  end

  scenario 'successfully selects 1 day' do
    user = create(:user)
    category = create(:category, name: 'Furadeira')
    create :price, days: 1, price: 40, category: category
    create :equipment, model: 'Makita', category: category
    create :equipment, model: 'Bosch', category: category
    customer = create(:customer)
    login_as(user)

    visit new_contract_path

    select '1', from: 'Prazo de locação'
    select customer.name, from: 'Cliente'
    check 'Makita'
    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    fill_in 'Data de início', with: '12/09/2016'
    fill_in 'Desconto', with: '10'

    click_on 'Criar contrato'

    expect(page).to have_content 'Prazo de locação'
    expect(page).to have_content '1 dia'
  end

  scenario 'do not select a rental period' do
    user = create(:user)
    category = create(:category, name: 'Furadeira')
    create :price, days: 3, price: 40, category: category
    create :equipment, model: 'Makita', category: category
    create :equipment, model: 'Bosch', category: category
    customer = create(:customer)
    login_as(user)

    visit new_contract_path

    select customer.name, from: 'Cliente'
    check 'Bosch'
    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    fill_in 'Data de início', with: '12/09/2016'
    fill_in 'Desconto', with: '10'

    click_on 'Criar contrato'

    expect(page).to have_content 'Você não preencheu alguns campos necessários.'
    expect(page).to have_content 'O Prazo de locação é obrigatório'
  end
end
