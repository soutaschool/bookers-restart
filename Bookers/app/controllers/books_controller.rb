class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new

  end

  def create
  	book = Book.new(book_params)
    book.save
    flash[:notice] = "successfully"
    redirect_to book_path(book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "successfully"
    redirect_to books_path
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "successfully"
    redirect_to book_path(book)
  end

  def book_params
      params.require(:book).permit(:title, :body)
  end
end