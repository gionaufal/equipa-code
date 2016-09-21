require 'rails_helper'

feature 'User creates a contract' do
  scenario 'successfully' do
    create :equipment, model: 'Furadeira'
    customer = create(:customer)

    visit new_contract_path

    select customer.name, from: 'Cliente'
    check 'Furadeira'
    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    select '15', from: 'Prazo de locação'
    fill_in 'Data de início', with: '12/09/2016'
    fill_in 'Valor', with: '500'
    fill_in 'Desconto', with: '10'
    click_on 'Criar contrato'

    expect(page).to have_content 'Campus Code'
    expect(page).to have_content 'Furadeira'
    expect(page).to have_content 'Rua Vergueiro'
    expect(page).to have_content 'João da Silva'
    expect(page).to have_content '4987984984685'
    expect(page).to have_content '15'
    expect(page).to have_content '12 de Setembro de 2016'
    expect(page).to have_content '500'
    expect(page).to have_content '10'
    # expect(page).to have_content(friendly_date Time.zone.today)
    expect(page).to have_link('Emitir recibo')
  end

  scenario 'User choses 2 equipment' do
    create :equipment, model: 'Furadeira'
    create :equipment, model: 'Britadeira'
    customer = create(:customer)

    visit new_contract_path

    select customer.name, from: 'Cliente'
    check 'Furadeira'
    check 'Britadeira'
    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    fill_in 'Data de início', with: '12 de Setembro de 2016'
    select '15', from: 'Prazo de locação'
    fill_in 'Valor', with: '500'
    fill_in 'Desconto', with: '10'
    click_on 'Criar contrato'

    expect(page).to have_content customer.name
    expect(page).to have_content 'Furadeira'
    expect(page).to have_content 'Britadeira'
    expect(page).to have_content 'Rua Vergueiro'
    expect(page).to have_content 'João da Silva'
    expect(page).to have_content '4987984984685'
    expect(page).to have_content '15'
    expect(page).to have_content '12 de Setembro de 2016'
    expect(page).to have_content '500'
    expect(page).to have_content '10'
    # expect(page).to have_content(friendly_date Time.zone.today)
  end
  scenario 'should fail if has missing necessary fields' do
    visit new_contract_path

    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    fill_in 'Data de início', with: '12 de Setembro de 2016'
    select '15', from: 'Prazo de locação'
    fill_in 'Valor', with: '500'
    fill_in 'Desconto', with: '10'

    click_on 'Criar contrato'

    expect(page).to have_content("Você não preencheu alguns campos \
                                  necessários.")
  end
end
