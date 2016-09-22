require 'rails_helper'

feature 'User list contracts closer to return date' do
  scenario 'successfully' do
    equipment = create(:equipment)
    contract_first = create(:contract, rental_period: 3, initial_date: '21-09-2016', equipment: [equipment])
    contract_second = create(:contract, rental_period: 5, initial_date: '21-09-2016', equipment: [equipment])
    contract_third = create(:contract, rental_period: 10, initial_date: '21-09-2016', equipment: [equipment])

    visit contracts_path

    expect(page).to have_css 'h1', 'Listagem de contratos'

    within 'table' do
      expect('thead tr th'). to have_content 'Contrato'
      expect('thead'). to have_content 'Responsável'
      expect('thead'). to have_content 'Data de retorno'
      expect('thead'). to have_content 'Prazo de locação'

      expect('tbody tr:first-child'). to have_content contract_first.id
      expect('tbody tr:nth-child(2)'). to have_content contract_second.id
      expect('tbody tr:last-child'). to have_content contract_third.id
    end
  end
end
