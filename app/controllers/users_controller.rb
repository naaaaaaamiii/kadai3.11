class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit 
    @user = User.find(params[:id])
  end
  
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end
  
  def update
    user = User.find(params[:id])
    user.update (user.params)
    redirect_to user_show_path(@user)
  end
  
 

  private
   def list_params
    params.require(:user).permit(:name, :introduction, :image)  
   end
  end