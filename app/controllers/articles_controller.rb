class ArticlesController < ApplicationController
  # load_and_authorize_resource

  def index
    if params[:search]
      articles = Article.search(params[:search])
      if articles.length > 0
        @articles = articles
      else
        @articles = nil
      end
    end
  end

  def show
    @article = Article.find(params[:id])
    @version = @article.versions.last
    @versions = @article.versions
  end

  def edit
    if logged_in?
      @article = Article.find(params[:id])
    else
      flash[:notice] = "You must be logged in to edit an article!"
      render 'show'
    end
  end

  def update
    if logged_in?
      @edit = Article.find(params[:id]).edits.create(article_params)
    else
      flash[:notice] = "You must be logged in to edit this article!"
      render 'show'
    end
  end

  def new
    if logged_in?
      @category = Category.find(params[:category_id])
      @article = Article.new
    else
      flash[:notice] = "You must be logged in to create an article!"
      redirect_to 'categories#index'
    end
  end

  def create
    if logged_in?
      @category = Category.find(params[:category_id])
      @article = Article.new(article_params)
      if @article.save
        @category.articles << @article
        current_user.articles << @article
        redirect_to new_article_version_path(@article.id)
      else
        flash[:notice] = "Unable to create article"
        redirect_to 'categories#index'
      end
    else
      flash[:notice] = "You must be logged in to create an article!"
      redirect_to 'categories#index'
    end
  end

  def destroy
    if admin
      article = Article.find(params[:id])
      category = article.category
      article.destroy
      redirect_to category_path(category)
    else
      flash[:notice] = "Unable to delete article"
      redirect_to article
    end
  end


  private
    def article_params
      params.require(:article).permit(:title)
    end

end
