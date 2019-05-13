class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "This article was successfully created"
      #redirect_to articles_path(@article)
      render :show
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    #@article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
