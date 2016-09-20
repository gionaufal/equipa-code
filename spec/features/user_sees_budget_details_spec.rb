require 'rails_helper'

feature 'user sees budget details' do
  scenario 'successfuly' do
    budget = Budget.create(name: 'Manuel', phone: '678467479', mail:'eu@mail.com',
                        body:'Quero alugar uma frigideira que caiba a minha sogra. Por 5 dias. Obrigado.')
    budget2 = Budget.create(name: 'Horácio', phone: '678467479', mail:'euho@mail.com',
                        body:'Quero alugar uma frigideira à diesel')


    visit budgets_path
    
    click_on budget2.name

    expect(page).to have_content(budget2.name)
    expect(page).to have_content(budget2.phone)
    expect(page).to have_content(budget2.mail)
    expect(page).to have_content(budget2.body)
  end
end
