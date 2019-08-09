class TuneTuningsController < ApplicationController
  # Convention methods order ==> Index, Show, New, Edit, Create, Update, Destroy 
  before_action :set_tune_tunings, only: [:edit_multiple, :update_multiple]

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def new_multiple
    @tune = Tune.find(params[:tune_id])
    @tune_tunings = []
    Tuning.all.each do |tuning|
      @tune_tunings << TuneTuning.new(tuning: tuning, tune: @tune)
    end
  end

  def create_multiple
    @tune = Tune.find(params[:tune_id])
    checked_tune_tuning_params = params[:tune_tunings].select {|tt| tt[:known] == "yes" }
    checked_tune_tuning_params.each do |tt_params|
      TuneTuning.create(tune_tuning_params(tt_params))
    end
    redirect_to tune_url(@tune)
  end

  def edit_multiple
    known_tunings = @known_tune_tunings.map {|tt| tt.tuning}
    unknown_tunings = Tuning.all - known_tunings
    unknown_tune_tunings = []
    unknown_tunings.each do |tuning|
      unknown_tune_tunings << TuneTuning.new(tuning: tuning, tune: @tune)
    end
    @tune_tunings = @known_tune_tunings + unknown_tune_tunings
  end
  
  def update_multiple
    checked_tune_tuning_params = params[:tune_tunings].select {|tt| tt[:known] == "yes" }
    unchecked_tune_tuning_params = params[:tune_tunings] - checked_tune_tuning_params
    checked_tune_tuning_params.each do |tt_params|
      if tt_params[:id].empty?
        TuneTuning.create(tune_tuning_params(tt_params))
      else
        TuneTuning.find(tt_params[:id]).update_attributes(tune_tuning_params(tt_params))
      end
    end
    unchecked_tune_tuning_params.each do |tt_params|
      unless tt_params[:id].empty?
        TuneTuning.find(tt_params[:id]).delete
      end
    end
    flash[:notice] = "Updated tunings"
    redirect_to tune_url(@tune)
  end

  private
  
  def tune_tuning_includes
    [:tuning, :tune]    
  end

  def set_tune_tunings
    @tune = Tune.find(params[:tune_id])
    @known_tune_tunings = @tune.tune_tunings
  end

  def tune_tuning_params(my_params)
    my_params.permit(:tuning_id, :tune_id)
  end
end