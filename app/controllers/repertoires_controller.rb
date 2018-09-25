class RepertoiresController < ApplicationController
  # Convention methods order ==> Index, Show, New, Edit, Create, Update, Destroy 
  before_action :set_repertoire, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @repertoire = Repertoire.new
    @repertoire.tune = Tune.find(params[:tune_id])
  end

  def edit
  end

  def create
    @repertoire = Repertoire.new(repertoire_params)
    @repertoire.user = current_user
    @repertoire.tune = Tune.find(params[:tune_id])
    @checked_instruments = Instrument.find(params[:repertoire][:instrument_ids].drop(1)) # drop first blank hidden
    @unchecked_instruments = current_user.instruments - @checked_instruments
    if @repertoire.save
      @repertoire.create_activity :create, owner: current_user
      @checked_instruments.each do |instrument|
        unless instrument.tunes.include?(@repertoire.tune)
          instrument.tunes << @repertoire.tune
        end
      end
      @unchecked_instruments.each do |instrument|
        if instrument.tunes.include?(@repertoire.tune)
          instrument.tunes.delete(@repertoire.tune)
        end
      end
      flash[:success] = @repertoire.tune.name + " was added to your repertoire"
      redirect_to tune_path(@repertoire.tune)
    else
      flash[:danger] = "Something went wrong"
      render tune_path(@repertoire.tune)
    end
  end

  def update
    @checked_instruments = Instrument.find(params[:repertoire][:instrument_ids].drop(1)) # drop first blank hidden
    @unchecked_instruments = current_user.instruments - @checked_instruments
    if @repertoire.update(repertoire_params)
      # @repertoire.create_activity :update, owner: current_user
      @checked_instruments.each do |instrument|
        unless instrument.tunes.include?(@repertoire.tune)
          instrument.tunes << @repertoire.tune
        end
      end
      @unchecked_instruments.each do |instrument|
        if instrument.tunes.include?(@repertoire.tune)
          instrument.tunes.delete(@repertoire.tune)
        end
      end
      flash[:success] = "Your instrument repertoire for " + @repertoire.tune.name + " was successfully edited"
      redirect_to tune_path(@tune)
    else
      flash[:danger] = "Something went wrong"
      render "edit"
    end
  end

  def destroy
    if @repertoire.user == current_user
      @repertoire.user.instruments.each do |instrument|
        if instrument.tunes.include?(@repertoire.tune)
          instrument.tunes.delete(@repertoire.tune)
        end
      end
      @repertoire.destroy
      flash[:danger] = @tune.name + " was removed from your repertoire"
      redirect_to tune_path(@tune)
    end
  end

  private
  
  def set_repertoire
    @repertoire = Repertoire.includes(:tune).find(params[:id])
    @tune = @repertoire.tune
  end

  def repertoire_params
    params.require(:repertoire).permit(:user_id, :tune_id, instrument_ids: [])
  end
end
