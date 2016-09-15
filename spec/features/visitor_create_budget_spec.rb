require 'rails_helper'

feature 'visitor create budget' do
  scenario 'successfully' do

    budget = Budget.new(name: 'Manuel', phone: '678467479', mail:'eu@mail.com',
                        body:'Quero alugar uma frigideira que caiba a minha sogra. Por 5 dias. Obrigado.')

    visit new_budget_path

    fill_in 'Nome', with: budget.name
    fill_in 'Telefone', with: budget.phone
    fill_in 'E-Mail', with: budget.mail
    fill_in 'Mensagem', with: budget.body

    click_on 'Enviar'

    expect(page).to have_content('Sua mensagem foi enviada com sucesso. Aguarde nosso contato.')
  end
end
