class Book < ApplicationRecord
    has_many :rentals, dependent: :destroy
    has_many :customers, through: :rentals
end
