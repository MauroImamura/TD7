casa = PropertyType.create!(title: 'Casa')
Property.create!({title: 'Casa com quintal em Copacabana',
                description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                property_type: casa
                })
cobertura = PropertyType.create!(title: 'Cobertura')
Property.create!({title: 'Cobertura em Manaus',
                description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                rooms: 5, bathrooms: 2, daily_rate: 200, parking_slot: false, property_type: cobertura
                })
