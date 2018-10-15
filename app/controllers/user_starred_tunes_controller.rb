class UserStarredTunesController < ApplicationController
  before_action :set_user_starred_tune, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user_starred_tune = UserStarredTune.new
    @user_starred_tune.tune = Tune.find(params[:tune_id])
    @goal_options = UserStarredTune::GOALS
  end

  def edit
  end

  def create
    @user_starred_tune = UserStarredTune.new(user_starred_tune_params)
    @user_starred_tune.tune = Tune.find(params[:tune_id])
    @user_starred_tune.user = current_user
    if @user_starred_tune.save
      flash[:success] = "Starred tune successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
    if @user_starred_tune.user == current_user
      @user_starred_tune.destroy
      flash[:danger] = @tune.name + " was removed from your starred list"
      redirect_to tune_path(@tune)
    end
  end

  private
  
  def set_user_starred_tune
    @user_starred_tune = UserStarredTune.includes(:tune).find(params[:id])
    @tune = @user_starred_tune.tune
  end

  def user_starred_tune_params
    params.require(:user_starred_tune).permit(:tune_id, :goal)
  end
end
