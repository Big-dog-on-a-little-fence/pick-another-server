class ProgressionsController < ApplicationController

  def create
    @chart = Chart.find(params[:chart_id])
    @progression = @chart.progressions.create(progression_params)
    4.times { @progression.measures.build }
  end
 
  private
    def progression_params
      params.require(:progression).permit(:part_number, :chord_list, :chart_id, chord_ids: [], 
                                          measures_attributes: [:id, :body, :_destroy])
    end

end
