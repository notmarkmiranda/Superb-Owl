class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def redirect_user
    redirect_to dashboard_path if current_user
  end

  def require_user
    flash[:alert] = "Sign in to view this path"
    redirect_to sign_in_path unless current_user
  end

  def current_user
    @current_user ||= User.includes(:pools, :admin_pools, :member_pools).find(session[:user_id]) if session[:user_id]
  end
end
