davi = PropertyOwner.create!(email: 'davi@mail.com.br', password: '123456')
elias = PropertyOwner.create!(email: 'elias@mail.com.br', password: '123456')
moises = User.create!(email: 'moises@mail.com.br', password: '123456')
casa = PropertyType.create!(title: 'Casa')
apartamento = PropertyType.create!(title: 'Apartamento')
manaus_am = PropertyLocation.create!(title: 'Manaus AM')
litoral_rj = PropertyLocation.create!(title: 'Litoral RJ')
litoral_sc = PropertyLocation.create!(title: 'Litoral SC')
foz_iguacu = PropertyLocation.create!(title: 'Foz do Iguaçu')
recife = PropertyLocation.create!(title: 'Recife PE')
sao_paulo = PropertyLocation.create!(title: 'São Paulo capital')
gramado = PropertyLocation.create!(title: 'Gramado RS')
sao_luiz = PropertyLocation.create!(title: 'São Luiz MA')
Property.create!({title: 'Casa com quintal em Copacabana',
                description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                property_type: casa, property_location: litoral_rj, property_owner: davi
                })
Property.create!({title: 'Cobertura em Manaus',
                description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                rooms: 5, bathrooms: 2, daily_rate: 200, parking_slot: false, property_type: apartamento,
                property_location: manaus_am, property_owner: elias
                })
Property.create!({title: 'Apartamento em Floripa',
                description: 'Apartamento com vista para o mar e 2 suites',
                rooms: 2, bathrooms: 3, daily_rate: 500, parking_slot: false, property_type: apartamento,
                property_location: litoral_sc, property_owner: elias
                })
Property.create!({title: 'Casa de campo próxima a Foz do Iguaçu',
                description: 'Casa de campo a 40 min de Foz do Iguaçu com espaço para churrasco',
                rooms: 5, bathrooms: 4, daily_rate: 800, parking_slot: true, pets: true, property_type: casa,
                property_location: foz_iguacu, property_owner: davi
                })
Property.create!({title: 'Apartamento RJ com vista para o mar',
                description: 'Apartamento 7° andar com vista para o mar',
                rooms: 2, parking_slot: false, bathrooms: 2, daily_rate: 800,
                property_type: apartamento, property_location: litoral_rj, property_owner: davi
                })
Property.create!({title: 'Chácara próxima de Floripa',
                description: 'Chácara nas proximidades de Florianópolis, 35 min até o centro.',
                rooms: 4, bathrooms: 2, daily_rate: 500, parking_slot: true, pets: true, property_type: casa,
                property_location: litoral_sc, property_owner: elias
                })
Property.create!({title: 'Apartamento em Manaus, próximo ao Shopping Ponta Negra',
                description: 'Apartamento 100 m² com suíte e bem localizado',
                rooms: 1, bathrooms: 2, daily_rate: 100, parking_slot: false, property_type: apartamento,
                property_location: manaus_am, property_owner: davi
                })