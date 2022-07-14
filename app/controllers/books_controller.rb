class BooksController < ApplicationController

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
       render :edit
    else
      redirect_to books_path
    end   
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :edit
    end
  end
   private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
