require 'rails_helper'

describe 'Visitor visit homepage' do

    it 'and view properties' do
        #Arrannge
        casa = PropertyType.create!(title: 'Casa')
        cobertura = PropertyType.create!(title: 'Cobertura')
        Property.create!({title: 'Casa com quintal em Copacabana',
                        description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                        rooms: 3, bathrooms: 3, daily_rate: 100, parking_slot: true, property_type: casa
                        })

        Property.create!({title: 'Cobertura em Manaus',
                        description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                        rooms: 5, bathrooms: 2, daily_rate: 200, parking_slot: false, property_type: cobertura
                        })
        #Act
        visit root_path
        #Assert
        expect(page).to have_content("Casa com quintal em Copacabana")
        expect(page).to have_content("Excelente casa, recém reformada com 2 vagas de garagem")
        expect(page).to have_content("Quartos: 3")
        expect(page).to have_content("Cobertura em Manaus")
        expect(page).to have_content("Cobertura de 300m2, churrasqueira e sauna privativa")
        expect(page).to have_content("Quartos: 5")
    end

    it 'and there is no property available' do
        #act
        visit root_path
        expect(page).to have_content("Nenhum imóvel disponível")
    end

    it 'and view properties details' do
        #arrange
        casa = PropertyType.create!(title: 'Casa')
        Property.create!({title: 'Casa com quintal em Copacabana',
                        description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                        rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                        property_type: casa
                        })
        
        
        visit root_path
        click_on 'Casa com quintal em Copacabana'

        expect(page).to have_content("Casa com quintal em Copacabana")
        expect(page).to have_content("Excelente casa, recém reformada com 2 vagas de garagem")
        expect(page).to have_content("Quartos: 3")
        expect(page).to have_content("Banheiros: 2")
        expect(page).to have_content("Aceita Pets: Sim")
        expect(page).to have_content("Estacionamento: Sim")
        expect(page).to have_content("Diária: R$ 500,00")
        expect(page).to have_content("Casa")    
    end

    it 'and view properties details and return to home' do
        casa = PropertyType.create!(title: 'Casa')
        Property.create!({title: 'Casa com quintal em Copacabana',
        description: 'Excelente casa, recém reformada com 2 vagas de garagem',
        rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
        property_type: casa
        })

        visit root_path
        click_on 'Casa com quintal em Copacabana'
        click_on 'Voltar'
        
        expect(current_path).to eq root_path
    end

end
