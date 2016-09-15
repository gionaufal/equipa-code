require 'rails_helper'

feature 'user creates customer' do
  scenario 'successfully' do
    customer = create(:customer)

    visit new_customer_path

    fill_in 'Nome', with: customer.name
    fill_in 'Endereço de faturamento', with: customer.billing_address
    fill_in 'E-Mail', with: customer.mail
    fill_in 'Telefone', with: customer.phone
    fill_in 'CNPJ', with: customer.cnpj

    click_on 'Cadastrar Cliente'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.billing_address)
    expect(page).to have_content(customer.mail)
    expect(page).to have_content(customer.phone)
    expect(page).to have_content(customer.cnpj)
  end

  scenario 'should fail if has missing fields' do

    customer = build(:customer)

    visit new_customer_path

    fill_in 'Nome', with: customer.name
    fill_in 'CNPJ', with: customer.cnpj

    click_on 'Cadastrar Cliente'

    expect(page).to have_content('Você precisa preencher todos os campos!')
  end
end
