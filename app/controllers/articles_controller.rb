class ArticlesController < ApplicationController
    before_action :findarticle, only: [:show, :edit, :update, :destroy]
    def show
        
    end
    def index
        @articles = Article.all
    end
    def new
        @article = Article.new
    end
    def edit
        
    end
    def create 
        # render plain: params[:article]
        @article = Article.new(article_params)
        if(@article.valid?)
            @article.save
            flash[:notice] = "New Article created successfully"
            redirect_to @article
        else
            render 'new'
        end
    end
    def update
        
        # @editarticle = Article.update(params.require(:article).permit(:title, :description))
        if @article.update(article_params)
            flash[:notice] = "Changes in the article saved successfully"
            redirect_to @article
        else
            render 'edit'
        end
    end
    def destroy
        @deletearticle = @article
        @deletearticle.destroy
        redirect_to articles_path
    end


    private

    def findarticle
        @article = Article.find_by(id: params[:id])
    end
    def article_params
        params.require(:article).permit(:title, :description)
    end
end