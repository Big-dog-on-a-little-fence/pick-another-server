class GenresController < ApplicationController
  before_action :set_genre, only: [:show]
  
  def index
    @genres = Genre.page(params[:page])
  end

  def show
    tunes_includes = [:lyric, :charts, :genres, :sources]
    @q = @genre.tunes.includes(tunes_includes).ransack(params[:q])
    @genre_tunes = @q.result.page(params[:page]).per(25)
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
