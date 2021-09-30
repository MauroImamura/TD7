class PropertyLocation < ApplicationRecord
    has_many :properties
    validates :title, presence: true
    validates :title, uniqueness: true
end
