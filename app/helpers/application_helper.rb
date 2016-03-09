module ApplicationHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def admin
    current_user && current_user.admin?
  end

  def categories
    @categories = Category.all
  end

  def author(article)
    current_user && current_user == article.author
  end

end
