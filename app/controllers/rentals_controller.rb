class RentalsController < ApplicationController
  def history
    @customers = Customer.all.order(:name)

    if params[:customer_id].present?
      @selected_customer = Customer.find(params[:customer_id])
      @rentals = @selected_customer.rentals.order(rented_on: :desc)
    end
  end
end
