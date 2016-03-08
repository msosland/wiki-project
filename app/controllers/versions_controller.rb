class VersionsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @version = Version.new
  end

  def create
    @version = Version.new(version_params)
    @article = Article.find(params[:article_id])
    if @version.save
      @article.versions << @version
      redirect_to article_path(@article.id)
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @version = Version.find(params[:id])
  end

  def update
    @version = Version.new(version_params)
    @article = Article.find(params[:article_id])
    if @version.save
      @article.versions << @version
      redirect_to article_path(@article.id)
    end
  end

    private
    def version_params
      params.require(:version).permit(:content)
    end

end
