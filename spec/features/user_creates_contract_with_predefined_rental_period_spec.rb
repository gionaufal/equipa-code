require 'rails_helper'

feature 'User creates contract with predefined rental period' do
  scenario 'successfully' do
    create :equipment

    visit new_contract_path

    select '5 dias', from: 'Prazo de locação'
    click_on 'Criar contrato'

    expect(page).to have_content 'Prazo de locação'
    expect(page).to have_content '5 dias'
  end
end
