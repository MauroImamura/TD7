require 'rails_helper'

describe 'Visitor register new region' do
    it 'successfully' do
        
        visit root_path
        click_on 'Cadastrar região'
        fill_in 'Nome', with: 'São Paulo'
        click_on 'Enviar'

        expect(page).to have_content('São Paulo')
    end

    it 'and do not succed on empty name field' do
        
        visit root_path
        click_on 'Cadastrar região'
        fill_in 'Nome', with: ''
        click_on 'Enviar'

        expect(page).to have_content('Não foi possível cadastrar: nome inválido')
    end

    it 'and try to submit a name that already exists' do
    
        PropertyLocation.create({title: 'São Paulo'})

        visit root_path
        click_on 'Cadastrar região'
        fill_in 'Nome', with: 'São Paulo'
        click_on 'Enviar'

        expect(page).to have_content('Não foi possível cadastrar: este nome já foi usado')
    end
end