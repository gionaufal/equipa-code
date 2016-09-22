require 'rails_helper'

feature 'user creates price' do
  scenario 'successfully' do
    category = create(:category)

    visit prices_path
    click_on 'Adicionar Preço'
    select category.name, from: 'Categoria'
    select '3',           from: 'Prazo'
    fill_in 'Preço',       with: '50'

    click_on 'Novo preço'

    expect(page).to have_content '50'
    expect(page).to have_content category.name
    expect(page).to have_content '3'
  end

  scenario 'fail if dont fill all fields' do
    category = create(:category)

    visit prices_path
    click_on 'Adicionar Preço'
    select category.name, from: 'Categoria'
    select '3',           from: 'Prazo'

    click_on 'Novo preço'

    expect(page).to have_content 'Todos os campos são obrigatórios'
  end

  scenario 'when creates new price for same thing, old thing disapears' do
    category = create(:category)
    create = create(:price, price: '50', category: category, days: '3' )

    visit prices_path

    click_on 'Editar Preço'

    fill_in 'Preço',       with: '70'

    click_on 'Novo preço'

    expect(page).to have_content '70'
    expect(page).not_to have_content '50'
    expect(page).to have_content category.name
    expect(page).to have_content '3'

  end
end
