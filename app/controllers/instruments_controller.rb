class InstrumentsController < ApplicationController
  # Convention methods order ==> Index, Show, New, Edit, Create, Update, Destroy
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  before_action :set_user_instrument_types, only: [:new, :create]
  before_action :set_type
  
  def index
    @instruments = type_class.all
  end
  
  def show
    @user = @instrument.user
    tune_includes = [:lyric, :charts, :genres, :tune_genres]
    @q = @instrument.tunes.includes(tune_includes).ransack(params[:q])
    @q.sorts = 'updated_at desc' if @q.sorts.empty?
    @instrument_tunes = @q.result.page(params[:page]).per(100)
  end

  def new
    @instrument = Instrument.new
  end
  
  def edit
  end
  
  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    @instrument.type = params[:instrument][:type]
    unless @user_instrument_types.include?(@instrument.type)
      if @instrument.save
        #@instrument.create_activity :create, owner: current_user
        flash[:success] = "Instrument was successfully added to your arsenal"
        redirect_to user_path(current_user)
      else
        render 'new'
      end
    else
      flash[:notice] = "This instrument is already in your arsenal"
      render 'new'
    end
  end
  
  def update
  end
  
  def destroy
  end
  
  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def set_type
    @type = type
  end

  def set_user_instrument_types
    @user_instrument_types = current_user.instruments.map {|i| i.type}
  end
  
  def type
    Instrument.types.include?(params[:type]) ? params[:type] : "Instrument"
  end

  def type_class
    type.constantize
  end
  
  def instrument_params
    params.require(:instrument).permit(:user, :type)
  end

end
