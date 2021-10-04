require 'rails_helper'

describe 'Visitor register property type' do
    it 'successfully' do
        property_owner = PropertyOwner.create!(email: 'ousuario@mail.com.br', password: '123456')

        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Cadastrar tipo'
        fill_in 'Nome', with: 'Apartamento'
        click_on 'Enviar'

        expect(page).to have_content('Apartamento')
    end

    it 'successfully and return to home' do
        property_owner = PropertyOwner.create!(email: 'ousuario@mail.com.br', password: '123456')

        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Cadastrar tipo'
        fill_in 'Nome', with: 'Apartamento'
        click_on 'Enviar'
        click_on 'Início'

        expect(current_path).to eq root_path
    end

    it 'and do not succed on empty name field' do
        property_owner = PropertyOwner.create!(email: 'ousuario@mail.com.br', password: '123456')

        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Cadastrar tipo'
        fill_in 'Nome', with: ''
        click_on 'Enviar'

        expect(page).to have_content('Nome não pode ficar em branco')
    end

    it 'and try to submit a name that already exists' do
        PropertyType.create({title: 'Apartamento'})
        property_owner = PropertyOwner.create!(email: 'ousuario@mail.com.br', password: '123456')

        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Cadastrar tipo'
        fill_in 'Nome', with: 'Apartamento'
        click_on 'Enviar'

        expect(page).to have_content('Nome já está em uso')
    end

    it 'but decide to return to home instead' do
        property_owner = PropertyOwner.create!(email: 'ousuario@mail.com.br', password: '123456')

        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Cadastrar tipo'
        click_on 'Início'

        expect(current_path).to eq root_path
    end
end