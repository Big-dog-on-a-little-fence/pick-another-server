class TunesController < ApplicationController
  # Convention methods order ==> Index, Show, New, Edit, Create, Update, Destroy
  before_action :set_tune, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @q = Tune.ransack(params[:q])
    @q.sorts = 'updated_at desc' if @q.sorts.empty?
    @tunes = @q.result.includes(:sources, :genres, :lyric, :charts, :instruments, 
                  :users, :users_that_have_starred).page(params[:page]).per(100)
    @path = tunes_path
  end

  def show
    @repertoire = Repertoire.where(tune_id: @tune.id, user_id: current_user.id).take
    @user_starred_tune = UserStarredTune.where(tune_id: @tune.id, user_id: current_user.id).take
  end

  def new
    @tune = Tune.new
  end

  def edit
  end

  def create
    @tune = Tune.new(tune_params)
    if @tune.save
      @tune.create_activity :create, owner: current_user
      flash[:success] = "Tune was created successfully"
      redirect_to tune_path(@tune)
    else
      render 'new'
    end
  end

  def update
    if @tune.update(tune_params)
      @tune.create_activity :update, owner: current_user
      flash[:success] = "Tune was successfully updated."
      redirect_to tune_path(@tune)
    else
      render 'edit' # render edit tune article page for another try
    end
  end

  private

  def set_tune
    tune_includes = [{comments: :user}, {comments: :commentable}, {comments: :comments}, 
                    charts: [progressions: [:measures]]]
    @tune = Tune.includes(tune_includes).find(params[:id])
  end

  def tune_params
    params.require(:tune).permit(:name, :key, :time_signature, genre_ids: [], user_ids: [], chart_ids: [])
  end
end
