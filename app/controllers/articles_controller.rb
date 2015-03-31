class ArticlesController < ApplicationController
  #caches_page :index  => for page caching
  #caches_action :index, :show

  def index
    @articles = Article.page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      #expire_action action:[:index,:show] #expire the cache whenever a new article is posted
      #expire_action(:controller => 'articles', :action => 'index')
      gflash :success => "The article has been created successfully!"
      redirect_to @article
    else
      gflash :now, :error => "Something went wrong."
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
