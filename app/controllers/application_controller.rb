class ApplicationController < ActionController::Base
  layout :resolve_layout
  helper_method :current_user, :logged_in?

  private

  def resolve_layout
    if current_user&.admin?
      "admin"
    elsif current_user&.member?
      "member"
    else
      "public"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: "Vous devez être connecté pour accéder à cette page."
    end
  end

  def require_admin
    unless current_user&.has_role?(:admin)
      flash[:alert] = "Vous n'avez pas les droits d'accès à cette page"
      redirect_to root_path
    end
  end

  def require_member
    unless current_user&.has_role?(:member)
      flash[:alert] = "Vous n'avez pas les droits d'accès à cette page"
      redirect_to root_path
    end
  end
end
