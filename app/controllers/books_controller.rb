class BooksController < ApplicationController
  before_action :ensure_book_belongs_to_current_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to #book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end


  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    end
  

  def show
#    @books = Book.all
    @show_book = Book.find(params[:id])
    @book = Book.new
    @user = current_user

  end

  def edit
#    @book = Book.new
    @book = Book.find(params[:id]) #Book.newではなく、編集対象を取得
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params) #book_params
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id) 
    else
#      @book = Book.find(params[:id])
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path 
  end

    # 投稿データのストロングパラメータ
    private

    def ensure_book_belongs_to_current_user
      book = Book.find(params[:id])
      unless book.user == current_user
        redirect_to books_path, alert: "You are not authorized to access this book."
      end
    end

    def book_params
      params.require(:book).permit(:title, :body)
    end


end
