class AuthorsController < ApplicationController

  # GET /authors
  def index
    @authors = Author.all
  end

  # GET /authors/1
  def show
    @author = Author.find(params[:id])
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
    @author = Author.find(params[:id])
  end

  # POST /authors
  def create
    @author = Author.new( first_name: params[:author][:first_name],
                          last_name: params[:author][:last_name],
                          nationality: params[:author][:nationality],
                          birth_year: params[:author][:birth_year])

    if @author.save
      redirect_to @author
    else
      render :new
    end
  end

  # PATCH/PUT /authors/1
  def update
    @author = Author.find(params[:id])

    if @author.update( first_name: params[:author][:first_name], 
                       last_name: params[:author][:last_name],
                       nationality: params[:author][:nationality],
                       birth_year: params[:author][:birth_year])
      redirect_to @author
    else
      render :edit
    end
  end

  # DELETE /authors/1
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end

end
