require 'rails_helper'

feature 'user creates customer' do
  scenario 'successfully' do
    customer = Customer.new(name: 'Empresa',
                            billing_address: 'rua dos bobos numero zero',
                            mail: 'empresa@bobos.com',
                            phone: '96432547',
                            cnpj: '12.678.456/0001-46')

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
end
