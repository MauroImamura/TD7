class PropertyLocation < ApplicationRecord
    has_many :properties
    validates :title, presence: { message: "Não foi possível cadastrar: nome inválido" }
    validates :title, uniqueness: { message: 'Não foi possível cadastrar: este nome já foi usado' }
end
