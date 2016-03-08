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
    @article = Article.find(params[:id])
  end

  def update
    @edit = Article.find(params[:id]).edits.create(article_params)
  end

  def new
    @category = Category.find(params[:category_id])
    @article = Article.new
  end



  def create
    @category = Category.find(params[:category_id])
    @article = current_user.articles.new(article_params)
    @category.articles << @article
    if @article.save
      redirect_to new_article_version_path(@article.id)
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

  def remove_featured
    article = Article.find(params[:id])
    article.remove_featured_status
    redirect_to article
  end

  def make_featured
    article = Article.find(params[:id])
    if Article.find_featured
      featured_article = Article.find_featured
      featured_article.remove_featured_status
    end
    article.make_featured_status
    redirect_to article
  end

  private
    def article_params
      params.require(:article).permit(:title)
    end

end
