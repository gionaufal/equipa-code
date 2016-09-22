require 'rails_helper'

feature 'user edits price' do
  scenario 'successfully' do
    category = create(:category)
    price = create(:price, category: category)

    visit prices_path
    click_on 'Editar Preço'

    fill_in 'Preço', with: '40'

    click_on 'Atualizar'

    expect(page).to have_content '40'
    expect(page).to have_content 'Preço atualizado com sucesso!'
  end
end
