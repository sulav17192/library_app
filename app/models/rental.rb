class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :book

  validates :rented_on, presence: true
  validate :returned_on_after_rented_on

  private

  def returned_on_after_rented_on
    return unless returned_on && rented_on

    if returned_on < rented_on
      errors.add(:returned_on, "must be after the rented date")
    end
  end
end
