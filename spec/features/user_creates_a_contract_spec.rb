require 'rails_helper'

feature 'User creates a contract' do
  scenario 'successfully without discount' do
    user = create(:user)
    category = create(:category, name: 'Furadeira')
    create :price, days: 1, price: 10, category: category
    create :equipment, model: 'Makita', category: category
    customer = create(:customer)

    login_as(user)
    visit new_contract_path

    select customer.name, from: 'Cliente'
    select '1', from: 'Prazo de locação'

    check 'Makita'
    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    fill_in 'Data de início', with: '12 de Setembro de 2016'
    click_on 'Criar contrato'

    expect(page).to have_content 'Campus Code'
    expect(page).to have_content 'Furadeira'
    expect(page).to have_content 'Makita'
    expect(page).to have_content 'Rua Vergueiro'
    expect(page).to have_content 'João da Silva'
    expect(page).to have_content '4987984984685'
    expect(page).to have_content '1'
    expect(page).to have_content '12 de Setembro de 2016'
    expect(page).to have_content 'R$ 10'
    # expect(page).to have_content Time.zone.today
    expect(page).to have_link('Emitir recibo')
  end

  scenario 'User choose 2 equipment' do
    user = create(:user)
    category = create(:category, name: 'Furadeira')
    create :price, days: 3, price: 40, category: category
    create :equipment, model: 'Makita', category: category
    create :equipment, model: 'Bosch', category: category
    customer = create(:customer)
    login_as(user)

    visit new_contract_path

    select customer.name, from: 'Cliente'
    check 'Makita'
    check 'Bosch'
    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    select '3', from: 'Prazo de locação'
    fill_in 'Data de início', with: '12/09/2016'
    click_on 'Criar contrato'

    expect(page).to have_content customer.name
    expect(page).to have_content 'Makita'
    expect(page).to have_content 'Bosch'
    expect(page).to have_content 'Rua Vergueiro'
    expect(page).to have_content 'João da Silva'
    expect(page).to have_content '4987984984685'
    expect(page).to have_content '3'
    expect(page).to have_content '12 de Setembro de 2016'
    expect(page).to have_content '80'
    # expect(page).to have_content Time.zone.today
  end

  scenario 'contract with discount' do
    user = create(:user)
    category = create(:category, name: 'Furadeira')
    create :price, days: 3, price: 40, category: category
    create :equipment, model: 'Makita', category: category
    create :equipment, model: 'Bosch', category: category
    customer = create(:customer)
    login_as(user)

    visit new_contract_path

    select customer.name, from: 'Cliente'
    check 'Makita'
    check 'Bosch'
    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    select '3', from: 'Prazo de locação'
    fill_in 'Desconto', with: 10
    fill_in 'Data de início', with: '12/09/2016'
    click_on 'Criar contrato'

    expect(page).to have_content customer.name
    expect(page).to have_content 'Makita'
    expect(page).to have_content 'Bosch'
    expect(page).to have_content 'Rua Vergueiro'
    expect(page).to have_content 'João da Silva'
    expect(page).to have_content '4987984984685'
    expect(page).to have_content '3'
    expect(page).to have_content '12 de Setembro de 2016'
    expect(page).to have_content 'R$ 72'
    # expect(page).to have_content Time.zone.today
  end

  scenario 'should fail if has missing necessary fields' do
    user = create(:user)
    category = create(:category, name: 'Furadeira')
    create :price, days: 1, price: 10, category: category
    create :equipment, model: 'Makita', category: category
    create(:customer)
    login_as(user)
    visit new_contract_path

    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    fill_in 'Data de início', with: '12/09/2016'
    fill_in 'Desconto', with: '10'

    click_on 'Criar contrato'

    expect(page).to have_content("Você não preencheu alguns campos \
                                  necessários.")
  end

  scenario 'and should be authenticated' do
    visit new_contract_path

    expect(current_path).to eq(new_user_session_path)
  end
end
