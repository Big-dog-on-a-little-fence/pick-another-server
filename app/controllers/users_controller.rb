class UsersController < ApplicationController
  ### Convention order ==> Index, Show, New, Edit, Create, Update, Destroy
  before_action :set_user, only: [:edit, :update, :show]
  
  def dashboard
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user_articles = @user.articles
  end
  
  def update
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