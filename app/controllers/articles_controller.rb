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



  def new
    @category = Category.find(params[:category_id])
    @article = Article.new
  end

  def create
    @article = Edit.new(article_params)
    if @article.save
      redirect_to article_path(@article.id)
    end
  end

  private
    def article_params
      params.require(:article).permit(:content)
    end

end
