require 'rails_helper'

feature 'user sees price table' do
  scenario 'successfully' do
    category = create(:category)

    visit prices_path

    expect(page).to have_css('table')
    expect(page).to have_content(category.name)
    expect(page).to have_content(category.days)
    expect(page).to have_content(category.price)
  end
end
