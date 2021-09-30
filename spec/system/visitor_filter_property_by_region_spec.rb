require 'rails_helper'

describe 'Visitor filter property by region' do
    it 'and see link on homepage' do
        PropertyLocation.create!( title: 'Litoral RJ')
        PropertyLocation.create!( title: 'SP capital')

        visit root_path

        expect(page).to have_link('Litoral RJ')
        expect(page).to have_link('SP capital')
    end

    it 'successfully' do
        casa = PropertyType.create!(title: 'Casa')
        litoral_rj = PropertyLocation.create!(title: 'Litoral RJ')
        Property.create!({title: 'Casa com quintal em Copacabana',
                description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                property_type: casa, property_location: litoral_rj
                })
        cobertura = PropertyType.create!(title: 'Cobertura')
        manaus_am = PropertyLocation.create!(title: 'Manaus AM')
        Property.create!({title: 'Cobertura em Manaus',
                description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                rooms: 5, bathrooms: 2, daily_rate: 200, parking_slot: false, property_type: cobertura,
                property_location: manaus_am
                })

        visit root_path
        click_on 'Litoral RJ'

        expect(page).to have_css('h1', text: 'Litoral RJ')
        expect(page).to have_link('Casa com quintal em Copacabana')
        expect(page).not_to have_content('Cobertura em Manaus')
    end

    it 'and return to homepage' do
        casa = PropertyType.create!(title: 'Casa')
        litoral_rj = PropertyLocation.create!(title: 'Litoral RJ')
        Property.create!({title: 'Casa com quintal em Copacabana',
                description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                property_type: casa, property_location: litoral_rj
                })
                
        visit root_path
        click_on 'Litoral RJ'
        click_on 'Voltar'

        expect(current_path).to eq root_path
    end

end