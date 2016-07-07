class TunesController < ApplicationController
  ### Convention methods order ==> Index, Show, New, Edit, Create, Update, Destroy
  before_action :set_tune, only: [:show, :edit, :update, :destroy]

  def index
    #@tunes = Tune.all
    @q = Tune.ransack(params[:q])
    @tunes = @q.result.includes(:genres).page(params[:page]).per(100)
  end

  def show
  end
  
  def new
    @tune = Tune.new
  end

  def create
    @tune = Tune.new(tune_params)
    if @tune.save
      flash[:success] = "Tune was created successfully"
      redirect_to tunes_path
    else
      render 'new'
    end
  end

  private  ## private functions

  def set_tune
    @tune = Tune.find(params[:id])
  end

  def tune_params
    params.require(:tune).permit(:name, :key, genre_ids: [], user_ids: [])
  end

end