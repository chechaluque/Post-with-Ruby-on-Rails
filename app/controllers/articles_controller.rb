class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  #get article id
  def show
    getId
    # @article = Article.find(params[:id])
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
  def edit
    getId
    # @article = Article.find(params[:id])
  end

  def destroy
    getId
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  def update
    getId
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  private
  def article_params
    params.require(:article).permit(:title, :body)

  end
  #this is the def to find a register id
  def getId
    @article = Article.find(params[:id])
  end
end
