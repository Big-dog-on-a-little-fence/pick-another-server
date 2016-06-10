class UsersController < ApplicationController
  before_action :set_user, only: [:update, :show, :destroy]
  before_action :require_admin, only: [:destroy]
  
  def dashboard
    redirect_to user_path(current_user)
  end
  
  def index
    #@users = User.all
    @users = User.page(params[:page])
  end
  
  def show
    #@user_articles = @user.articles
    @user_articles = @user.articles.page(params[:page])
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