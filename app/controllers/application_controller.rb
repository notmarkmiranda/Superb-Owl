class ApplicationController < ActionController::Base
  def require_user
    redirect_to lets_go_path unless current_user
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
