require 'rails_helper'

describe 'PropertyType' do
    it 'has name' do
        property_type = PropertyType.new()

        property_type.valid?

        expect(property_type.errors.full_messages_for(:title)).to include('Nome não pode ficar em branco')
    end

    it 'unique name' do
        PropertyType.create!(title: 'Casa')
        property_type = PropertyType.new(title: 'Casa')

        property_type.valid?

        expect(property_type.errors.full_messages_for(:title)).to include('Nome já está em uso')
    end
end
