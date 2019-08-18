class ActivitiesController < ApplicationController
  def index
    activities_includes = [:owner, :trackable]
    @q = PublicActivity::Activity.ransack(params[:q])
    @activities = @q.result.includes(activities_includes).order("created_at desc").page(params[:page]).per(50)
    # @activity_types = {"Tune":"Tune", "InstrumentTune":"Learned Tune", "Comment":"Comment"}
    @activity_types = ["Tune", "InstrumentTune", "Comment"]
  end
end
