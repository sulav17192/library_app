class BooksController < ApplicationController
  include BooksHelper
  def index
    @books = Book.all
  end

  def show
     @book = Book.find(params[:id])
  end

  def new
    @book= Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = "We have added a new #{formatted_author(@book)}!"
      redirect_to library_books_path
    else
      render :new  
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book= Book.find(params[:id])

    if @book.update(book_params)
      flash[:notice] = "Updated #{formatted_author(@book)} successfully!"
      redirect_to library_books_path
    else
      render :edit
    end
  end

  def destroy
    @book= Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book deleted successfully"
    redirect_to library_books_path
  end


private

  def book_params
   params.require(:book).permit(:title, :author, :rating)
  end
end
