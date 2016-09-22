require 'rails_helper'

feature 'visitor visits root page' do
  scenario 'visits navbar links' do
    visit root_path

    expect(page).to have_content('Equipa')
    expect(page).to have_css('img', 'Rafael')

    click_on 'Emitir Contrato'

    expect(page).to have_content 'Responsável na obra'

    click_on 'Cadastrar Equipamento'

    expect(page).to have_content 'Número de Série'

    click_on 'Cadastrar Clientes'

    expect(page).to have_content 'Endereço de faturamento'

    click_on 'Enviar Orçamento'

    expect(page).to have_content 'Mensagem'

    click_on 'Tabela de Preços'

    expect(page).to have_content 'Quantidade de Dias'
  end

  scenario 'views contracts' do
    category = create :category, name: 'Furadeira'
    create :price, days: 1, price: 40, category: category
    equipment = create :equipment, category: category

    create(:contract, equipment: [equipment], rental_period: 1)
    create(:contract, equipment: [equipment], rental_period: 1)
    create(:contract, equipment: [equipment], rental_period: 1)
    create(:contract, equipment: [equipment], rental_period: 1)

    visit root_path

    expect(page).to have_content 'Campus Code'
    expect(page).to have_content equipment.model
  end
end
