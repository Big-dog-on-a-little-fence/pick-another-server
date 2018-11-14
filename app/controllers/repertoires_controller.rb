class RepertoiresController < ApplicationController
  # Convention methods order ==> Index, Show, New, Edit, Create, Update, Destroy 
  before_action :set_repertoire, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @repertoire = Repertoire.new
    @repertoire.tune = Tune.find(params[:tune_id])
    @user = current_user
    @user.instruments.each do |instrument|
      @repertoire.instrument_repertoires.build(instrument: instrument, repertoire: @repertoire)
    end
  end

  def edit
  end

  def create
    @repertoire = Repertoire.new(repertoire_params)
    @repertoire.user = current_user
    @repertoire.tune = Tune.find(params[:tune_id])
    @checked_instruments = Instrument.find(params[:repertoire][:instrument_repertoires].drop(1)) # drop first blank hidden
    @checked_instruments.each do |instrument|
      @repertoire.instrument_repertoires.build(instrument: instrument, repertoire: @repertoire)
    end
    if @repertoire.save
      @repertoire.create_activity :create, owner: current_user
      flash[:success] = @repertoire.tune.name + " was added to your repertoire"
      redirect_to tune_path(@repertoire.tune)
    else
      flash[:danger] = "Something went wrong"
      render "new"
    end
  end

  def update
    @repertoire = Repertoire.update_attributes(repertoire_params)
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
    @repertoire = Repertoire.includes(:tune, :user, :instruments).find(params[:id])
    @tune = @repertoire.tune
    # @repertoire_instrument_ids = @repertoire.instrument_tunes.map {|it| it.instrument.id}
  end

  def repertoire_params
    params.require(:repertoire).permit(:user_id, :tune_id, instrument_repertoires: [:instrument])
  end
end