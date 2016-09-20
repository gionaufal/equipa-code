require 'rails_helper'

feature 'user navigates through budgets' do
  scenario 'successfully' do
    budget = Budget.create(name: 'Manuel', phone: '678467479', mail:'eu@mail.com',
                        body:'Quero alugar uma frigideira que caiba a minha sogra. Por 5 dias. Obrigado.')

    visit budgets_path

    expect(page).to have_content(budget.excerpt)
  end

  scenario 'empty index' do
    visit budgets_path

    expect(page).to have_content('No momento ainda não existem orçamentos')
  end
end
