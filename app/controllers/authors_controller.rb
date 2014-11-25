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
    @author = Author.new()
  end

  # POST /authors
  def create
    @author = Author.new(author_params)
    if @author.save
      # success case
      redirect_to authors_path
    else
      render 'new'
    end
   
  end

  # GET author/:id/edit
  def edit
    @author = Author.find(params[:id])
  end

  # PUT /authors/:id
  def update
    @author = Author.find(params[:id])
    
    if @author.update(author_params)
      redirect_to author_path(@author) 
    else 
      render 'edit'
    end
  end


  # DELETE /authors/1
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end

end


def author_params
  params.require(:author).permit(
    :first_name,
    :last_name,
    :nationality,
    :birth_year
  )
end