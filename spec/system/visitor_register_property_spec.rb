require 'rails_helper'

describe 'Visitor register property' do
    it 'successfully' do
    
        visit root_path
        click_on 'Cadastrar imóvel'
        fill_in 'Título', with: 'Casa em Florianópolis'
        fill_in 'Descrição', with: 'Ótima casa próxima a UFSC'
        fill_in 'Quartos', with: '3'
        fill_in 'Banheiros', with: '2'
        fill_in 'Diária', with: 200
        check 'Aceita Pets'
        check 'Vaga de estacionamento'
        click_on 'Enviar'

        expect(page).to have_content('Casa em Florianópolis')
        expect(page).to have_content('Ótima casa próxima a UFSC')
        expect(page).to have_content('Quartos: 3')
        expect(page).to have_content('Banheiros: 2')
        expect(page).to have_content('Aceita Pets: Sim')
        expect(page).to have_content('Estacionamento: Sim')
        expect(page).to have_content('Diária: R$ 200,00')
    end

    it 'but decide to return to home instead' do
        
        visit root_path
        click_on 'Cadastrar imóvel'
        click_on 'Voltar'

        expect(current_path).to eq root_path
    end

    it 'and try to register property without title and not succed' do
    
        visit root_path
        click_on 'Cadastrar imóvel'
        fill_in 'Descrição', with: 'Ótima casa próxima a UFSC'
        fill_in 'Quartos', with: '3'
        fill_in 'Banheiros', with: '2'
        fill_in 'Diária', with: 200
        click_on 'Enviar'

        expect(page).to have_content('Não foi possível cadastrar')
    end

    it 'and try to register property without description and not succed' do
    
        visit root_path
        click_on 'Cadastrar imóvel'
        fill_in 'Título', with: 'Casa em Florianópolis'
        fill_in 'Quartos', with: '3'
        fill_in 'Banheiros', with: '2'
        fill_in 'Diária', with: 200
        click_on 'Enviar'

        expect(page).to have_content('Não foi possível cadastrar')
    end 

    it 'and try to register property without rooms and not succed' do
    
        visit root_path
        click_on 'Cadastrar imóvel'
        fill_in 'Título', with: 'Casa em Florianópolis'
        fill_in 'Descrição', with: 'Ótima casa próxima a UFSC'
        fill_in 'Banheiros', with: '2'
        fill_in 'Diária', with: 200
        click_on 'Enviar'

        expect(page).to have_content('Não foi possível cadastrar')
    end 

    it 'and try to register property without bathrooms and not succed' do
    
        visit root_path
        click_on 'Cadastrar imóvel'
        fill_in 'Título', with: 'Casa em Florianópolis'
        fill_in 'Descrição', with: 'Ótima casa próxima a UFSC'
        fill_in 'Quartos', with: '3'
        fill_in 'Diária', with: 200
        click_on 'Enviar'

        expect(page).to have_content('Não foi possível cadastrar')
    end

    it 'and try to register property without daily rate and not succed' do
    
        visit root_path
        click_on 'Cadastrar imóvel'
        fill_in 'Título', with: 'Casa em Florianópolis'
        fill_in 'Descrição', with: 'Ótima casa próxima a UFSC'
        fill_in 'Quartos', with: '3'
        fill_in 'Banheiros', with: '2'
        click_on 'Enviar'

        expect(page).to have_content('Não foi possível cadastrar')
    end
end
