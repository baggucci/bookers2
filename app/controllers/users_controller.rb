class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) 
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id) 
    else
      render :edit
    end
  end

  def index
    @user = current_user #User.find(params[:id])
    @users = User.all
    @book = Book.new

  end

  private

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
