require 'rails_helper'

describe 'user books property' do
    it 'successfully' do
        owner = PropertyOwner.create!(email: 'owner@mail.com.br', password: '123456')
        casa = PropertyType.create!(title: 'Casa')
        litoral_rj = PropertyLocation.create!(title: 'Litoral RJ')
        property = Property.create!({title: 'Casa com quintal em Copacabana',
                description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                property_type: casa, property_location: litoral_rj, property_owner: owner
                })
        user = User.create!(email: 'user@mail.com.br', password: '123456')

        login_as user, scope: :user
        visit root_path
        click_on property.title
        fill_in 'Data de início', with: '06/10/2021'
        fill_in 'Data de término', with: '10/10/2021'
        fill_in 'Quantidade de pessoas', with: '3'
        click_on 'Enviar pedido'
        
        expect(page).to have_content('06/10/2021')
        expect(page).to have_content('10/10/2021')
        expect(page).to have_content(/3/)
        expect(page).to have_content('R$ 2.000,00')
        expect(page).to have_content('Pedido enviado com sucesso')
    end
end