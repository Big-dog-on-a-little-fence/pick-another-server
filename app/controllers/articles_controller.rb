class ArticlesController < ApplicationController
    def new
        @article = Article.new 
    end
    
    def create
        @article = Article.new(article_params)
        @article.save
        redirect_to @article
    end

    def index
        # @articles = Article.paginate(page: params[:page], per_page: 5)
    end
  
    def edit
    end
  
    def update
        if @article.update(article_params)
            flash[:success] = "Article was successfully updated."
            redirect_to article_path(@article)
        else
            render 'edit'  ## render edit article template in case of failure for another try
        end      
    end
  
    def show
    end
  
    def destroy
        @article.destroy
        flash[:danger] = "Article was successfully deleted."
        redirect_to articles_path
    end
  
    private
        def set_article  ## create private method to reuse
            @article = Article.find(params[:id])
        end
    
        def article_params  # whitelist method
            params.require(:article).permit(:title, :description)
        end
    
end
