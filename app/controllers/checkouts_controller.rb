class CheckoutsController < ApplicationController
  def new
    @books = Book.all
  end

  def create
    result = CheckoutService.new(checkout_params).perform

    if result.success?
      flash[:notice] = "Book checked out successfully!"
      redirect_to checkout_path
    else
      render :new
    end
  end

 private

def checkout_params
  params.permit(:book_id, :customer_email, :rented_on, :returned_on)
end
end