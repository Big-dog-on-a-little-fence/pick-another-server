class GenresController < ApplicationController
  before_action :set_genre, only: [:show]
  
  def index
    @genres = Genre.all
  end

  def show
    @genre_articles = @genre.articles
  end
  
  def new
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "Category was created successfully"
      redirect_to genres_path
    else
      render 'new'
    end
  end
  
  private  ## private functions
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
  def set_genre
    @genre = Genre.find(params[:id])
  end

end
