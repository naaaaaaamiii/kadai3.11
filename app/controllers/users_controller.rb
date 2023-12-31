class UsersController < ApplicationController
 
before_action :authenticate_user!
before_action :is_matching_login_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @book_new = Book.new
    @users = User.all
  end


  def update
    @user = User.find(params[:id])
    @user.update (user_params)
     if @user.save
        flash[:notice]="successfully!!!!!!!!!!!!!!!!!!!!!!!!!!user update完了"
        redirect_to user_path(current_user.id)
     else
        render :edit
     end
  end



  private
   def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
   end
   
   def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
   
   
 end