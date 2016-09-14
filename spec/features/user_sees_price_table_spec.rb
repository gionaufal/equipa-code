require 'rails_helper'

feature 'user sees price table' do
  scenario 'successfully' do
    category = create(:category)

    price = create(:price, category: category)

    visit prices_path

    expect(page).to have_css('table')
    expect(page).to have_content(category.name)
    expect(page).to have_content(price.days)
    expect(page).to have_content(price.price)
  end
end
