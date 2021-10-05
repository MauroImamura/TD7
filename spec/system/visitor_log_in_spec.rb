require 'rails_helper'

describe 'Visitor log in' do
    context 'as property owner' do
        it 'successfully' do
            property_owner = PropertyOwner.create!(email: 'proprietario@mail.com.br', password: '123456')

            visit root_path
            click_on 'Entrar como proprietário'
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
            property_owner = PropertyOwner.create!(email: 'proprietario@mail.com.br', password: '123456')

            login_as property_owner, scope: :property_owner
            visit root_path
            click_on 'Logout'

            expect(page).to have_content('Saiu com sucesso')
            expect(page).not_to have_link('Logout')
            expect(page).to have_link('Entrar como proprietário')
            expect(page).not_to have_link('Cadastrar imóvel')
            expect(page).not_to have_content(property_owner.email)
        end

        it 'but decide to return to home' do
            visit root_path
            click_on 'Entrar como proprietário'
            click_on 'Início'
            
            expect(current_path).to eq root_path
        end
    end

    context 'for the first time (sign up)' do
        it 'successfully as property owner' do
            visit root_path
            click_on 'Entrar como proprietário'
            click_on 'Cadastrar'
            fill_in 'Email', with: 'owner@domain.com'
            fill_in 'Senha', with: '123456'
            fill_in 'Confirmação de Senha', with: '123456'
            click_on 'Cadastrar'

            expect(page).to have_content('Cadastro efetuado com sucesso')
        end

        it 'successfully as user' do
            visit root_path
            click_on 'Entrar como usuário'
            click_on 'Cadastrar'
            fill_in 'Email', with: 'user@domain.com'
            fill_in 'Senha', with: '123456'
            fill_in 'Confirmação de Senha', with: '123456'
            click_on 'Cadastrar'

            expect(page).to have_content('Cadastro efetuado com sucesso')
        end
    end

    context 'as user' do
        it 'successfully' do
            user = User.create!(email: 'usuario@mail.com.br', password: '123456')

            visit root_path
            click_on 'Entrar como usuário'
            fill_in 'Email', with: user.email
            fill_in 'Senha', with: user.password
            within 'form' do
                click_on 'Entrar'
            end

            expect(page).to have_content('Login efetuado com sucesso!')
            expect(page).to have_content(user.email)
            expect(page).to have_link('Logout')
            expect(page).not_to have_content('Entrar como usuário')
        end 

        it 'and logs out' do
            user = User.create!(email: 'usuario@mail.com.br', password: '123456')

            login_as user, scope: :user
            visit root_path
            click_on 'Logout'

            expect(page).to have_content('Saiu com sucesso')
            expect(page).not_to have_link('Logout')
            expect(page).to have_link('Entrar como proprietário')
            expect(page).not_to have_content(user.email)
        end

        it 'but decide to return to home' do
            visit root_path
            click_on 'Entrar como usuário'
            click_on 'Início'
            
            expect(current_path).to eq root_path
        end
    end
end