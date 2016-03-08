class CategoriesController < ApplicationController
  # load_and_authorize_resource
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @article = Article.new
  end

end
