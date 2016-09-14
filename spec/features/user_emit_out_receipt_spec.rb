require 'rails_helper'

feature 'User emit receipt out' do
  scenario 'successfully out' do
    @contract = Contract.create('vagas', 'furadeira', '230', 'R. teste', 'Joao'
                                '36576809385', '3', '21/10/2016','350,00', '10')
    visit contract_path @contract

    click_on 'Recibo'

    expect(page).to have_content '123456789'
    expect(page).to have_content 'Furadeira'
    expect(page).to have_content 'Rua teste'
    expect(page).to have_content '09/12/2016'
    expect(page).to have_content ''

  end
end
