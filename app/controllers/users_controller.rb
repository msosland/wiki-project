class UsersController < ApplicationController
  # load_and_authorize_resource

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    @edited_articles = @user.edited_articles
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
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
