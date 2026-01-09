class CreateRentals < ActiveRecord::Migration[8.1]
  def change
    create_table :rentals do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :rented_on
      t.date :returned_on

      t.timestamps
    end
  end
end
