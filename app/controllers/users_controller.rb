class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.book
    @book = Book.new
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if
      user.update(user_params) 
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(user.id) 
    else
      flash.now[:alert] = "投稿に失敗しました。" #キーをalertに変更
      render :index
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :Introduction)
  end

end
