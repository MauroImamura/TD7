require 'rails_helper'

describe Property do
    context 'validations' do
=begin         it 'name must be present' do
            property = Property.new()

            property.valid?

            expect(property.errors.full_messages_for(:title)).to include('Título não pode ficar em branco')
        end 
=end
    end
end
