class ProgressionsController < ApplicationController
  
  def create
    @chart = Chart.find(params[:chart_id])
    @progression = @chart.progressions.create(progression_params)
  end
 
  private
    def progression_params
      params.require(:progression).permit(:part_number, :chord_list, :chart_id, chord_ids: [])
    end

end
