class ChartsController < ApplicationController
  
  def new
    @tune = Tune.find(params[:tune_id])
    @chart = Chart.new
    2.times { @chart.progressions.build}
  end

  def create
    @tune = Tune.find(params[:tune_id])
    @chart = @tune.charts.create(chart_params)
    redirect_to tune_path(@tune)
  end
 
  private
    def chart_params
      params.require(:chart).permit(:name, :tune_id, progression_ids: [])
    end

end
