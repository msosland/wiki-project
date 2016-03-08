class VersionsController < ApplicationController
  def new
    @categories = Category.all
  end
end
