require 'rails_helper'

feature 'user creates price' do
  scenario 'successfully' do
    category = create(:category)

    visit prices_path
    click_on 'Adicionar Preço'
    select category.name, from: 'Categoria'
    select '3',           from: 'Prazo'
    fill_in 'Preço',       with: '30'

    click_on 'Novo preço'

    expect(page).to have_content '30'
    expect(page).to have_content category.name
    expect(page).to have_content 'Prazo: 3 dias'
  end
end
