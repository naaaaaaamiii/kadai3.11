class BooksController < ApplicationController

  def create
     @book_new = Book.new(book_params)
     @book_new.user_id = current_user.id
      if @book_new.save
         flash[:notice]="successfully!!!!!!!!!!!!!!!!!!!!!!!!!!create後"
         redirect_to user_path(current_user.id)
      else
         render :index
      end
  end
     
     
  

  def index
     @user = current_user
     @book_new = Book.new
     @books = Book.all
  end

  def show
     @book = Book.find(params[:id])
     @user = @book.user
     @book_new = Book.new

  end

  def edit
     @book = Book.find(params[:id])
     

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(current_user.id)
  end

  def update
    @book = Book.find(params[:id])
       if @book.update (book_params)
          flash[:notice]="successfully!!!!!!!!!!!!!!!!!!!!!!!!!!"
          redirect_to book_path(book.id)
       else
          render :edit
       end
  end



  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
