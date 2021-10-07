class User < ApplicationRecord
  has_many :property_books
  has_many :properties, through: :property_books
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
