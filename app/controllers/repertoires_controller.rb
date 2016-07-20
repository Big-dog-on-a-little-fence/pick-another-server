class RepertoiresController < ApplicationController
  ### Convention methods order ==> Index, Show, New, Edit, Create, Update, Destroy 
  before_action :set_repertoire, only: [:show, :destroy]
  
  def show
  end
  
  def new
    @repertoire = Repertoire.new
    create
  end

  def create
    @repertoire = Repertoire.new
    @repertoire.user = current_user
    @repertoire.tune = Tune.find(params[:tune_id])
    if @repertoire.save
      flash[:success] = @repertoire.tune.name + " was added to your repertoire"
      redirect_to tune_path(@repertoire.tune)
    else
      flash[:danger] = "Something went wrong"
      render tune_path(@repertoire.tune)
    end
  end

  def destroy
    @repertoire.destroy
    flash[:danger] = @tune.name + " was removed from your repertoire"
    redirect_to tune_path(@tune)
  end

  private  ## private methods
  
  def set_repertoire
    @repertoire = Repertoire.find(params[:id])
    @tune = @repertoire.tune
  end
  
end
