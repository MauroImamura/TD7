require 'rails_helper'

describe 'Visitor log in' do
    context 'as property owner' do
        it 'successfully' do
            property_owner = PropertyOwner.create!(email: 'ousuario@mail.com.br', password: '123456')

            visit root_path
            click_on 'Entrar'
            fill_in 'Email', with: property_owner.email
            fill_in 'Senha', with: property_owner.password
            within 'form' do
                click_on 'Entrar'
            end

            expect(page).to have_content('Login efetuado com sucesso!')
            expect(page).to have_content(property_owner.email)
            expect(page).to have_link('Logout')
            expect(page).not_to have_content('Entrar')
            expect(page).to have_link('Cadastrar imóvel')
        end 

        it 'and logs out' do
            property_owner = PropertyOwner.create!(email: 'ousuario@mail.com.br', password: '123456')

            login_as property_owner, scope: :property_owner
            visit root_path
            click_on 'Logout'

            expect(page).to have_content('Saiu com sucesso')
            expect(page).not_to have_link('Logout')
            expect(page).to have_link('Entrar')
            expect(page).not_to have_link('Cadastrar imóvel')
            expect(page).not_to have_content(property_owner.email)
        end

        #TODO registro do property_owner: email, senha, confirmação de senha
    end
end