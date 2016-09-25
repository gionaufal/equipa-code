require 'rails_helper'

feature 'User signs in' do
  scenario 'from home page' do
    user = create(:user)

    visit root_path

    click_on 'Área administrativa'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Olá #{user.email}")
  end

  scenario 'and does not see Area administrativa' do
    user = create(:user)

    visit root_path

    click_on 'Área administrativa'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    expect(page).not_to have_content('Área administrativa')

  end
end
