require 'rails_helper'

feature 'visitor visits root page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Equipa')
    expect(page).to have_css('nav', 'orçamento')
    expect(page).to have_css('img', 'Rafael')
  end
end
