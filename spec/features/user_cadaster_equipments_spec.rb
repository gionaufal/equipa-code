require 'rails_helper'

feature 'User cadaster equipments' do
  scenario 'succesfully' do
    build :category, name: 'Britadeiras'
    build :category, name: 'Furadeiras'
    build :category, name: 'Andaimes'

    visit new_equipment_path

    select 'Britadeiras', from: 'Categorias'
  end
end
