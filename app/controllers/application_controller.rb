class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def logged_in?
    !!current_user
  end

  def login_required
    unless logged_in?
      flash[:error] = "You must be logged in to acces this section"
      redirect_to_new_login_url
    end
  end

  def admin_login_required
    unless current_user && current_user.is_admin?
      flash[:error] = "Sorry, you don't have access to that."
      redirect_to root_url and return false
    end
  end

end
