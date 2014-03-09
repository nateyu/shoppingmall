class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :login_required
  helper_method :current_user, :current_mall

  def set_current_user
    unless current_user
      user = User.find_by(name: params[:username])
      session[:current_user_id] = user.id if user.try(:authenticate, params[:password])
    end
    current_user
  end

  def login_required
    if current_user.nil?
      redirect_to root_url
    end
  end

  def admin_required
    unless current_user.admin?
      redirect_to root_url
    end
  end

  def current_user
    @current_user ||= User.find_by_id session[:current_user_id]
  end

  def current_mall
    current_user.try(:mall)
  end
end
