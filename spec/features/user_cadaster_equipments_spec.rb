require 'rails_helper'

feature 'User cadaster equipments' do
  scenario 'succesfully' do
    create :category, name: 'Britadeiras'
    create :category, name: 'Furadeiras'
    create :category, name: 'Andaimes'

    visit new_equipment_path

    select 'Britadeiras', from: 'Categorias'
    fill_in 'Modelo', with: 'X870'
    fill_in 'Número de Série', with: '2234'
    fill_in 'Número de Inventário', with: '10234'
    fill_in 'Valor do Equipamento', with: '200'
    click_on 'Cadastrar'

    expect(page).to have_content 'Britadeiras'
    expect(page).to have_content 'X870'
    expect(page).to have_content '2234'
    expect(page).to have_content '10234'
    expect(page).to have_content '200'
  end

  scenario 'should fill all fields' do
    visit new_equipment_path

    click_on 'Cadastrar'

    expect(page).to have_content 'Todos os campos são obrigatórios'
  end
end
