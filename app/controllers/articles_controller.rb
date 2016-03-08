class ArticlesController < ApplicationController
  # load_and_authorize_resource

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @edit = Article.find(params[:id]).edits.create(article_params)
  end

  def new
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to new_article_version_path(@article.id)
    end
  end

  private
    def article_params
      params.require(:article).permit(:title)
    end

end
