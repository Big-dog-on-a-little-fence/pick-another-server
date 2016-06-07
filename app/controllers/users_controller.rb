class UsersController < ApplicationController
  before_action :set_user, only: [:update, :show]
  
  def dashboard
    redirect_to user_path(current_user)
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user_articles = @user.articles
  end
  
  def update  ## added for devise username modification
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end

  private  ### private functions
    def set_user
      @user = User.find(params[:id])
    end

end