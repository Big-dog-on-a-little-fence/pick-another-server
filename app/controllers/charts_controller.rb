class ChartsController < ApplicationController
  before_action :set_chart, only: [:show, :edit, :update, :destroy]

  def show
  end 

  def new
    @tune = Tune.find(params[:tune_id])
    @chart = @tune.charts.new
    1.times { @chart.progressions.build}
  end

  def edit
  end

  def create
    @tune = Tune.find(params[:tune_id])
    @chart = @tune.charts.new(chart_params)
    if @chart.save
      flash[:success] = "Chord chart was created successfully"
      redirect_to tune_path(@tune)
    else
      render 'new'
    end
  end
 
  def update
    if @chart.update(chart_params)
      flash[:success] = "Chord chart was successfully updated."
      redirect_to tune_path(@tune)
    else
      render 'edit'  ## render edit template in case of failure for another try
    end
  end
 
  private  ## private functions

  def set_chart
    @tune = Tune.find(params[:tune_id])
    @chart = Chart.find(params[:id])
  end

  def chart_params
    params.require(:chart).permit(:name, :tune_id, 
                   progressions_attributes: [:id, :chord_list, :part_number, :_destroy, 
                   measures_attributes: [:id, :body, :_destroy]])
  end

end
