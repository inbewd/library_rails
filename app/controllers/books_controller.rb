class BooksController < ApplicationController

  # GET /books
  def index
    @books = Book.all
  end

  # GET /books/1
  def show
    @author = Book.find(params[:id])
  end

  # GET /books/new
  def new
    @author = Book.new
  end

  # GET /books/1/edit
  def edit
    @author = Book.find(params[:id])
  end

  # POST /books
  def create
    @author = Book.new( title: params[:book][:title],
                        publication_date: params[:book][:publication_date],
                        author_id: params[:book][:author_id] )

    if @author.save
      redirect_to @author
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  def update
    @author = Book.find(params[:id])

    if @author.update( title: params[:book][:title],
                       publication_date: params[:book][:publication_date],
                       author_id: params[:book][:author_id] )

      redirect_to @author
    else
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @author = Book.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end

end
