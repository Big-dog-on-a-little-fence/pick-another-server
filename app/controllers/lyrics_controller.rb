class LyricsController < ApplicationController
  ### Convention order ==> Index, Show, New, Edit, Create, Update, Destroy
  before_action :set_lyric, only: [:show, :create, :edit, :update, :destroy]
  
  def index
  end
  
  def show
  end
  
  def new
    @tune = Tune.find(params[:tune_id])
    @lyric = Lyric.new
  end

  def edit
  end
  
  def create
    @tune.lyric = Lyric.new(lyric_params)
    if @tune.lyric.save
      flash[:success] = "Lyrics were successfully created "
      redirect_to tune_path(@tune)
    else
      render 'new'
    end
  end

  def update
    if @lyric.update(lyric_params)
      flash[:success] = "Lyrics were successfully updated."
      redirect_to tune_path(@tune)
    else
      render 'edit'  ## render edit template in case of failure for another try
    end
  end

  private  ## private functions

  def set_lyric
    @tune = Tune.find(params[:tune_id])
    @lyric = @tune.lyric
  end

  def lyric_params
    params.require(:lyric).permit(:version, :body, :tune_id)
  end
end
