class ArticlesController < ApplicationController
  # load_and_authorize_resource

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
    @article = Article.new(article_params)
    if @article.save
      @category.articles << @article
      current_user.articles << @article
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


  private
    def article_params
      params.require(:article).permit(:title)
    end

end
