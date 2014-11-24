class BooksController < ApplicationController

  # GET /books
  def index
    @books = Book.all
  end

  # GET /books/1
  def show
    @author = Book.find(params[:id])
  end

  # DELETE /books/1
  def destroy
    @author = Book.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end

end
