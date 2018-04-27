class InstrumentsController < ApplicationController
  # Convention methods order ==> Index, Show, New, Edit, Create, Update, Destroy
  
  def index
    @instruments = Instrument.all
  end
  
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
  
  private
  
  def set_type
    @type = type
  end
  
  def type
    Instrument.types.include?(params[:type]) ? params[:type] : "Instrument"
  end
  
  def type_class
    type.constantize
  end
  
end
