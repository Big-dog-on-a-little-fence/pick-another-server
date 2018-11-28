class RepertoiresController < ApplicationController
  # Convention methods order ==> Index, Show, New, Edit, Create, Update, Destroy 
  before_action :set_repertoire, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @instrument_tunes = []
    current_user.instruments.each do |i|
      @instrument_tunes << InstrumentTune.new(instrument: i)
    end
  end

  def edit
  end

  def create
    params[:instrument_tunes].each do |instrument_tune_params|
      InstrumentTune.create(instrument_tune_params)
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

  def instrument_tune_params
    params.require(:instrument_tune).permit(:instrument, :tune, :tunings)
  end
end