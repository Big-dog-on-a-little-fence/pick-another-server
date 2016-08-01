class UsersController < ApplicationController
  ### Convention methods order ==> Index, Show, New, Edit, Create, Update, Destroy
  before_action :set_user, only: [:update, :show, :destroy, :repertoire, :recordings]
  before_action :require_admin, only: [:destroy]

  def dashboard
    redirect_to user_path(current_user)
  end
  
  def index
    #@users = User.all
    @users = User.page(params[:page])
  end
  
  def show
    # @q = @user.articles.ransack(params[:q])
    # @user_articles = @q.result.page(params[:page]).per(25)
    @recent_tunes = @user.tunes.order(created_at: :desc).take(10)
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
    #@user = current_user
    @q = @user.articles.ransack(params[:q])
    @user_articles = @q.result.page(params[:page]).per(25)
  end
  
  def repertoire
    #@user = current_user
    @q = @user.tunes.ransack(params[:q])
    @q.sorts = 'updated_at desc' if @q.sorts.empty?
    @user_tunes = @q.result.page(params[:page]).per(100)
  end

  private  ### private functions
  
  def set_user
    @user = User.find(params[:id])
  end
    
  def require_admin
    if user_signed_in? and !current_user.admin?
      flash[:danger] = "Only admin users can perform that action" 
      redirect_to root_path
    end
  end

end
