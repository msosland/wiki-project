class ArticlesController < ApplicationController
  # load_and_authorize_resource

  def new
    @category = Category.find(params[:category_id])
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render 'show'
    end
  end

  private
    def article_params
      params.require(:article).permit(:content)
    end

end
