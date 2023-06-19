class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end
  
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end
  

  private
   def list_params
    params.require(:user).permit(:name, :introduction, :image)  
    end
  end