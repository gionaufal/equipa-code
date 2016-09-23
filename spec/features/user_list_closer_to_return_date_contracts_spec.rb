require 'rails_helper'

feature 'User list contracts closer to return date' do
  scenario 'successfully' do
    contracts = create_contracts_list

    visit contracts_path

    expect(page).to have_css 'h1', 'Listagem de contratos'

    within('tbody tr:first-child') do
      expect(page).to have_content contracts.third.id
    end

    within('tbody tr:nth-child(2)') do
      expect(page).to have_content contracts.second.id
    end

    within('tbody tr:last-child') do
      expect(page).to have_content contracts.first.id
    end
  end

  scenario 'user visits contract details' do
    contracts = create_contracts_list

    visit contracts_path

    click_on contracts.first.id

    expect(page).to have_content contracts.first.id
  end

  private

  def create_contracts_list
    equipment = create(:equipment)
    rental_periods = [10, 5, 3]
    list = []
    rental_periods.each do |n|
      list << create(:contract, rental_period: n,
                                initial_date: '21-09-2016',
                                equipment: [equipment])
    end
    list
  end
end
