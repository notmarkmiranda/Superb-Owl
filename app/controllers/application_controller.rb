class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def require_user
    flash[:alert] = "Sign in to view this path"
    redirect_to sign_up_path unless current_user
    # redirect_to sign_in_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
