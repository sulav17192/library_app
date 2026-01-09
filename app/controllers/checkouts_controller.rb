class CheckoutsController < ApplicationController
  def new
    @books = Book.all
  end

  def create
    result = CheckoutService.new(checkout_params).perform

    if result.success?
      flash[:notice] = "Book successfully checked out to #{result.customer.name}!"
      redirect_to checkout_path
    else
      render :new
    endrails generate controller Checkouts new create
  end

  private
  def checkout_params
    params.require(:checkout).permit(:book_id, :customer_email, :rented_on, :returned_on)
  end
end
