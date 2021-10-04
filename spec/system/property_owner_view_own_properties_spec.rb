require 'rails_helper'

describe 'Porperty owner view own properties' do
    it 'using menu' do
        property_owner = PropertyOwner.create!(email: 'ousuario@mail.com.br', password: '123456')

        login_as property_owner, scope: :property_owner
        visit root_path

        expect(page).to have_link('Meus imóveis', href: my_properties_properties_path)
    end

    it 'and should view owned properties' do
        ousuario = PropertyOwner.create!(email: 'ousuario@mail.com.br', password: '123456')
        ooutro = PropertyOwner.create!(email: 'ooutro@mail.com.br', password: '123456')
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
                property_location: manaus_am, property_owner: ooutro
                })

        login_as ousuario, scope: :property_owner
        visit root_path
        click_on 'Meus imóveis'

        expect(page).to have_link 'Casa com quintal em Copacabana'
        expect(page).not_to have_content 'Cobertura em Manaus'
    end

    it 'and has no properties yet' do
        ousuario = PropertyOwner.create!(email: 'ousuario@mail.com.br', password: '123456')

        login_as ousuario, scope: :property_owner
        visit root_path
        click_on 'Meus imóveis'

        expect(page).to have_content('Você ainda não tem imóveis cadastrados.')
        expect(page).to have_link('Cadastre agora!', href: new_property_path)
    end
end