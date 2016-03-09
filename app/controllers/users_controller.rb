class UsersController < ApplicationController
  # load_and_authorize_resource
  def index
    if admin
      @users = User.all
    else
      redirect_to categories_path
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
      @articles = @user.articles
      @edited_articles = @user.edited_articles.uniq
    else
      redirect_to categories_path
    end
  end

  def new
    @categories = Category.all
    @user = User.new
  end

  def create
    @categories = Category.all
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to categories_path
      else
        render 'new'
      end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attribute("status", "admin")
      redirect_to @user
    else
      redirect_to @user
    end
  end

  def destroy
    if admin
      @user = User.find(params[:id])
      @user.destroy
      flash.notice = "#{@user.name} has been destroyed."
      redirect_to users_path
    else
      redirect_to categories_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :image)
  end


end
