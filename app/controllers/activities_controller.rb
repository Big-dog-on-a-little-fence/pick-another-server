class ActivitiesController < ApplicationController
  def index
    activities_includes = [:owner, :trackable]
    @activities = PublicActivity::Activity.includes(activities_includes).order("created_at desc")
    @activities = @activities.page(params[:page]).per(50)
  end
end
