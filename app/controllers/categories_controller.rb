class CategoriesController < ApplicationController
  # load_and_authorize_resource
  def index
    @category = Category.new
    @categories = Category.all
  end

end
