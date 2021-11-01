class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update]
  
  def index
    @ordered_genres = Genre.all.left_joins(:tunes).group(:id).order('COUNT(tunes.id) DESC')
    @genres = @ordered_genres.page(params[:page])
  end

  def show
    tunes_includes = [:users, :users_that_have_starred, :instruments, :lyric, 
                      :charts, :genres, :sources]
    @q = @genre.tunes.includes(tunes_includes).ransack(params[:q])
    @genre_tunes = @q.result.page(params[:page]).per(25)
    @user = current_user
    @current_user_tunes = Tune.user_tunes(current_user)
  end
  
  def new
    @genre = Genre.new
  end
  
  def edit
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

  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to @genre, notice: 'Genre was successfully updated.' }
        format.json { render :show, status: :ok, location: @genre }
      else
        format.html { render :edit }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  private  ## private functions
  
  def genre_params
    params.require(:genre).permit(:name, :description)
  end
  
  def set_genre
    @genre = Genre.find(params[:id])
  end

end
