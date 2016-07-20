class SourcesController < ApplicationController
  ### Convention order ==> Index, Show, New, Edit, Create, Update, Destroy
  before_action :set_source, only: [:show, :edit, :update, :destroy]
  
  def index
  end
  
  def show
  end
  
  def new
    @tune = Tune.find(params[:tune_id])
    @source = @tune.sources.new
  end

  def edit
  end
  
  def create
    @tune = Tune.find(params[:tune_id])
    @source = @tune.sources.new(source_params)
    if @source.save
      flash[:success] = "Resource was created successfully"
      redirect_to tune_path(@tune)
    else
      render 'new'
    end
  end

  def update
    if @source.update(source_params)
      flash[:success] = "Resource was successfully updated."
      redirect_to tune_path(@tune)
    else
      render 'edit'  ## render edit article template in case of failure for another try
    end
  end

  private  ## private functions

  def set_source
    @tune = Tune.find(params[:tune_id])
    @source = Source.find(params[:id])
  end

  def source_params
    params.require(:source).permit(:version, :link, :description, :tune_id)
  end

end