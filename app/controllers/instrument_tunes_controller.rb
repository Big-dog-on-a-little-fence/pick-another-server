class InstrumentTunesController < ApplicationController
  # Convention methods order ==> Index, Show, New, Edit, Create, Update, Destroy 
  before_action :set_instrument_tunes, only: [:edit_multiple, :update_multiple]

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def new_multiple
    @tune = Tune.find(params[:tune_id])
    @instrument_tunes = []
    current_user.instruments.each do |instrument|
      @instrument_tunes << InstrumentTune.new(instrument: instrument, tune: @tune)
    end
  end

  def create_multiple
    @tune = Tune.find(params[:tune_id])
    checked_instrument_tune_params = params[:instrument_tunes].select {|it| it[:known] == "yes" }
    checked_instrument_tune_params.each do |it_params|
      instrument_tune = InstrumentTune.create(instrument_tune_params(it_params))
      instrument_tune.create_activity :create, owner: current_user
    end
    redirect_to tune_url(@tune)
  end

  def edit_multiple
    known_instruments = @known_instrument_tunes.map {|it| it.instrument}
    unknown_instruments = current_user.instruments - known_instruments
    unknown_instrument_tunes = []
    unknown_instruments.each do |instrument|
      unknown_instrument_tunes << InstrumentTune.new(instrument: instrument, tune: @tune)
    end
    @instrument_tunes = @known_instrument_tunes + unknown_instrument_tunes
  end
  
  def update_multiple
    checked_instrument_tune_params = params[:instrument_tunes].select {|it| it[:known] == "yes" }
    unchecked_instrument_tune_params = params[:instrument_tunes] - checked_instrument_tune_params
    checked_instrument_tune_params.each do |it_params|
      if it_params[:id].empty?
        instrument_tune = InstrumentTune.create(instrument_tune_params(it_params))
        instrument_tune.create_activity :create, owner: current_user
      else
        InstrumentTune.find(it_params[:id]).update_attributes(instrument_tune_params(it_params))
      end
    end
    unchecked_instrument_tune_params.each do |it_params|
      unless it_params[:id].empty?
        InstrumentTune.find(it_params[:id]).delete
      end
    end
    flash[:notice] = "Updated repertoire"
    redirect_to tune_url(@tune)
  end

  private
  
  def instrument_tune_includes
    [:instrument, :tune]    
  end

  def set_instrument_tunes
    @tune = Tune.find(params[:tune_id])
    @known_instrument_tunes = current_user.instrument_tunes_for_tune(@tune)
  end

  def instrument_tune_params(my_params)
    my_params.permit(:instrument_id, :tune_id, tuning_ids: [])
  end
end