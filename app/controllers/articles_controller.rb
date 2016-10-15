class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  #get article id
  def show
    @article = Article.find(params[:id])
  end
  #get articles view
  def new
    @article = Article.new
  end
  #Post /articles
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  private
  def article_params
    params.require(:article).permit(:title, :body)

  end
end
