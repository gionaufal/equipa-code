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

  end

  scenario 'views contracts' do

    create(:contract)
    create(:contract)
    create(:contract)
    create(:contract)
    create(:contract)
    create(:contract)


    visit root_path

    expect(page).to have_content 'Campus Code'
  end
end
