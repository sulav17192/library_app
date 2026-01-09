class Customer < ApplicationRecord
    has_many :rentals, dependent: :destroy
    has_many :books, through: :rentals
end
