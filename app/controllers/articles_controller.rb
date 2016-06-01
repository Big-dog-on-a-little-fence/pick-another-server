class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new 
  end

  def edit
  end

  def create
    render plain: params[:article].inspect
  end

  def show
  end

  private
    def article_params  # whitelist method
      params.require(:article).permit(:title, :description)
    end

end
