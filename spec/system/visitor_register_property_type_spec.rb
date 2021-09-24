require 'rails_helper'

describe 'Visitor register property type' do
    it 'successfully' do

        visit root_path
        click_on 'Cadastrar tipo'
        fill_in 'Nome', with: 'Apartamento'
        click_on 'Enviar'

        expect(page).to have_content('Apartamento')
    end

    it 'and do not succed on empty name field' do
        
        visit root_path
        click_on 'Cadastrar tipo'
        fill_in 'Nome', with: ''
        click_on 'Enviar'

        expect(page).to have_content('Não foi possível cadastrar: nome inválido')
    end

    it 'and try to submit a name that already exists' do
    
        PropertyType.create({title: 'Apartamento'})

        visit root_path
        click_on 'Cadastrar tipo'
        fill_in 'Nome', with: 'Apartamento'
        click_on 'Enviar'

        expect(page).to have_content('Não foi possível cadastrar: este nome já foi usado')
    end
end