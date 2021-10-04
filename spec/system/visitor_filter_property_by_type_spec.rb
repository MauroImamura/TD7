require 'rails_helper'

describe 'Visitor filter property by type' do
    it 'and see options on the nav bar' do
        PropertyType.create!( title: 'Casa')
        PropertyType.create!( title: 'Apartamento')

        visit root_path

        expect(page).to have_link('Casa')
        expect(page).to have_link('Apartamento')
    end

    it 'and should see properties of same type after clicking on it' do
        ousuario = PropertyOwner.create!(email: 'ousuario@mail.com.br', password: '123456')
        casa = PropertyType.create!(title: 'Casa')
        litoral_rj = PropertyLocation.create!(title: 'Litoral RJ')
        Property.create!({title: 'Casa com quintal em Copacabana',
                description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                property_type: casa, property_location: litoral_rj, property_owner: ousuario
                })
        cobertura = PropertyType.create!(title: 'Cobertura')
        manaus_am = PropertyLocation.create!(title: 'Manaus AM')
        Property.create!({title: 'Cobertura em Manaus',
                description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                rooms: 5, bathrooms: 2, daily_rate: 200, parking_slot: false, property_type: cobertura,
                property_location: manaus_am, property_owner: ousuario
                })
        
        visit root_path
        click_on 'Casa'

        expect(page).to have_css('h1', text: 'Casa')
        expect(page).to have_link('Casa com quintal em Copacabana')
        expect(page).not_to have_content('Cobertura em Manaus')
        expect(page).to have_content('Excelente casa, recém reformada com 2 vagas de garagem')
        expect(page).to have_content('Quartos: 3')
    end

    it 'and return to homepage' do
        ousuario = PropertyOwner.create!(email: 'ousuario@mail.com.br', password: '123456')
        casa = PropertyType.create!(title: 'Casa')
        litoral_rj = PropertyLocation.create!(title: 'Litoral RJ')
        Property.create!({title: 'Casa com quintal em Copacabana',
                description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                property_type: casa, property_location: litoral_rj, property_owner: ousuario
                })
                
        visit root_path
        click_on 'Casa'
        click_on 'Início'

        expect(current_path).to eq root_path
    end
end