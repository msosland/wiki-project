class UsersController < ApplicationController
  # load_and_authorize_resource
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    @edited_articles = @user.edited_articles
  end

  def new
    @user = User.new
  end

  def create
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
    @user = User.find(params[:id])
    @user.destroy
    flash.notice = "#{@user.name} has been destroyed."
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :image)
  end


end
