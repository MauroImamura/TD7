require 'rails_helper'

describe 'user view own profile' do
    it 'from top menu' do
        user = User.create!(email: 'user@mail.com.br', password: '123456')

        visit root_path
        click_on 'Entrar como usuário'
        fill_in 'Email', with: user.email
        fill_in 'Senha', with: user.password
        within 'form' do
            click_on 'Entrar'
        end
        click_on user.email

        expect(page).to have_content('Meu Perfil:')
        expect(page).to have_content(user.email)
        expect(current_path).to eq my_profile_path
    end
end