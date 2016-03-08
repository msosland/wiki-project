class CategoriesController < ApplicationController
  # load_and_authorize_resource
  def index
    @featured_article = Article.find_featured
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @article = Article.new
  end

end
