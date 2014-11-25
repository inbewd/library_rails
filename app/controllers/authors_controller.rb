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

  # POST /authors
  def create
    # raise params.to_yaml
    # author_info_hash = params[:author]

    author_info_hash = params.require(:author).permit(
      :first_name,
      :last_name,
      :nationality,
      :birth_year
    )

    new_author = Author.create(author_info_hash)

    # new_author = Author.create(
    #   {first_name: author_info_hash[:first_name],
    #    last_name: author_info_hash[:last_name],
    #    nationality: author_info_hash[:nationality],
    #    birth_year: author_info_hash[:birth_year]
    #  }
    # )

    # to index
    redirect_to authors_path 

    # or to the author
    # redirect_to author_path(new_author)
    # and with magic, can also just pass the object

  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    author_update_hash = params.require(:author).permit(
      :first_name,
      :last_name,
      :nationality,
      :birth_year
    )

    @author.update(author_update_hash)

    redirect_to authors_path 
  end


  # DELETE /authors/1
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end

end
