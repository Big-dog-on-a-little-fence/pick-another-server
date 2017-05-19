class ChordsController < ApplicationController

  def create
    @progression = Progression.find(params[:progression_id])
    @chord = @progression.chords.create(chord_params)
    #redirect_to article_path(@article)
  end
 
  private
    def chord_params
      params.require(:chord).permit(:name, :progression_id)
    end

end
