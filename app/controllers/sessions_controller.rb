class SessionsController < ApplicationController

  def new
    render 'users/login'
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'users/login'
    end
  end

  def destroy
    session.clear
    redirect_to "/"
  end


end
