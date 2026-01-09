class CheckoutService
  attr_reader :errors, :rental

  def initialize(params)
    @book_id = params[:book_id]
    @customer_email = params[:customer_email]
    @rented_on = params[:rented_on]
    @returned_on = params[:returned_on]
    @errors = []
  end

  def perform
    find_customer
    find_book
    create_rental
    self
  end

  def success?
    @errors.empty?
  end

  private

  def find_customer
    if @customer_email.blank?
      @errors << "Customer email is required"
      return
    end

    @customer = Customer.find_by(email: @customer_email)

    if @customer.nil?
      @customer = Customer.new(
        email: @customer_email,
        name: @customer_email.split("@").first.titleize
      )

      unless @customer.save
        @errors << "Customer could not be created"
      end
    end
  end

  def find_book
    @book = Book.find_by(id: @book_id)

    if @book.nil?
      @errors << "Book not found"
    end
  end

  def create_rental
    return unless @errors.empty?

    @rental = Rental.new
    @rental.book = @book
    @rental.customer = @customer
    @rental.rented_on = @rented_on
    @rental.returned_on = @returned_on

    unless @rental.save
      @rental.errors.full_messages.each do |msg|
        @errors << msg
      end
    end
  end
end
