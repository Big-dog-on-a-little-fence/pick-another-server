class MeasuresController < ApplicationController

  def create
    @progression = Progression.find(params[:progression_id])
    @measure = @progression.measures.create(measure_params)
  end
 
  private
    def measure_params
      params.require(:measure).permit(:body, :progression_id)
    end

end
