class VersionsController < ApplicationController
  def new
    if logged_in?
      @article = Article.find(params[:article_id])
      @version = Version.new
    else
      flash[:notice] = "You must be logged in to update an article!"
      redirect_to 'categories#index'
    end
  end

  def create
    if logged_in?
      @article = Article.find(params[:article_id])
      @version = @article.versions.new(version_params)
      current_user.versions << @version
      if @version.save
        redirect_to article_path(@article.id)
      else
        flash[:notice] = "Unable to create new version."
        redirect_to @article
      end
    else
      flash[:notice] = "You must be logged in to update an article!"
      redirect_to 'categories#index'
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    if logged_in?
      @version = Version.find(params[:id])
    else
      flash[:notice] = "You must be logged in to update an article!"
      redirect_to @article
    end
  end

  def update
    if logged_in?
      @article = Article.find(params[:article_id])
      @version = @article.versions.new(version_params)
      current_user.versions << @version
      if @version.save
        redirect_to article_path(@article.id)
      else
        flash[:notice] = "Unable to update article"
        redirect_to @article
      end
    else
      flash[:notice] = "You must be logged in to update an article!"
      redirect_to @article

    end
  end

    private
    def version_params
      params.require(:version).permit(:content)
    end

end
