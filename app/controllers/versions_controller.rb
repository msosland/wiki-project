class VersionsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @version = Version.new
  end

  def create
    @article = Article.find(params[:article_id])
    @version = @article.versions.new(version_params)
    current_user.versions << @version
    if @version.save
      redirect_to article_path(@article.id)
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @version = Version.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @version = @article.versions.new(version_params)
    current_user.versions << @version
    if @version.save
      redirect_to article_path(@article.id)
    end
  end

    private
    def version_params
      params.require(:version).permit(:content)
    end

end
