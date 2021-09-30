require 'rails_helper'

describe 'PropertyLocation' do
    it 'has name' do
        property_location = PropertyLocation.new()

        property_location.valid?

        expect(property_location.errors.full_messages_for(:title)).to include('Nome não pode ficar em branco')
    end

    it 'unique name' do
        PropertyLocation.create!(title: 'Litoral RJ')
        property_location = PropertyLocation.new(title: 'Litoral RJ')

        property_location.valid?

        expect(property_location.errors.full_messages_for(:title)).to include('Nome já está em uso')
    end
end
