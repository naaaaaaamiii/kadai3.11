class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @book.save
     redirect_to books_path(@book)
  end

  def index
     @user = current_user
     @book = Book.new
     @books = Book.all
  end

  def show
     @user = User.find(params[:id])
     @book_new = Book.new
     @book = Book.find(params[:id])
  end

  def edit
     @book = Book.find(params[:id])
     
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
