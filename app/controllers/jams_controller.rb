class JamsController < ApplicationController
  ### Convention methods order ==> Index, Show, New, Edit, Create, Update, Destroy 
  before_action :set_jam, only: [:show, :destroy]
  before_action :set_tunes, only: [:show]
  
  def show
    @tune = @tunes.sample
    ## @q = @tunes.ransack(params[:q])
    ## @jam_tunes = @q.result.page(params[:page]).per(25)
  end
  
  def new
    @jam = Jam.new
  end

  def create
    @jam = Jam.new(jam_params)
    if @jam.save
      flash[:success] = "Jam created successfully"
      redirect_to jam_path(@jam)
    else
      render 'new'  ## render new article template in case of failure for another try
    end
  end

  def destroy
  end

  private  ## private methods
  
  def set_jam
    @jam = Jam.find(params[:id])
  end
  
  def set_tunes
    @tunes = Tune.all
    unless @jam.users.length < 1
      @jam.users.each do |user|
        @tunes &= user.tunes
      end
    end
  end

  def jam_params
    params.require(:jam).permit(:name, user_ids: [])
  end

end
