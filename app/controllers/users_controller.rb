class UsersController < ApplicationController
  # Convention methods order ==> Index, Show, New, Edit, Create, Update, Destroy
  before_action :set_user, only: [:update, :show, :destroy, :repertoire, :recordings]
  before_action :require_admin, only: [:destroy]

  def dashboard
    redirect_to user_path(current_user)
  end
  
  def index
    @users = User.page(params[:page])
  end
  
  def show
    @recent_repertoires = @user.repertoires.includes(:tune).take(10) # reps ordered by id desc in user model
    @recent_tunes = @recent_repertoires.map { |r| r.tune }
    @instruments = @user.instruments.left_joins(:tunes).group(:id).order('COUNT(tunes.id) DESC')
  end
  
  def update  ## added for devise username modification
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end

  def destroy
    @user.destroy
    flash[:danger] = "User and all articles created by user have been deleted"
    redirect_to users_path
  end

  def recordings
    @q = @user.articles.ransack(params[:q])
    @user_articles = @q.result.page(params[:page]).per(25)
  end
  
  def repertoire
    tune_includes = [:users, :users_that_have_starred, :lyric, :charts, :genres,
                    :sources, repertoires: [:instruments]]
    @q = @user.tunes.includes(tune_includes).ransack(params[:q])
    @q.sorts = 'updated_at desc' if @q.sorts.empty?
    @user_tunes = @q.result.page(params[:page]).per(100)
    @path = repertoire_user_path(@user)
  end

  private
  
  def set_user
    user_includes = [:repertoires, :user_starred_tunes]
    @user = User.includes(user_includes).find(params[:id])
  end
  
  def require_admin
    if user_signed_in? and !current_user.admin?
      flash[:danger] = "Only admin users can perform that action" 
      redirect_to root_path
    end
  end

end
