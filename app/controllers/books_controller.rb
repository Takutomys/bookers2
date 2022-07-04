class BooksController < ApplicationController
  
  def new
  end 
  
  def create
  end   
  
  def index
    @user=current_user
    @books=Book.all
  end 
  
  def show
  end   
end
