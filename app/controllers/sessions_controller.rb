class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_by(email: params[:email])
    user.generate_code

    redirect_to confirmation_path(user)
  end

  def confirmation
  end

  def confirm
    user = User.find_by(id: params[:user_id])
    if user&.confirm?(params[:confirmation_code])
      session[:user_id] = params[:user_id]
      redirect_to dashboard_path
    else
      render :confirmation
    end
  end
end
