class SessionsController < ApplicationController
  before_action :redirect_user, except: [:destroy]
  before_action :require_user, only: [:destroy]

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome!"
      redirect_to dashboard_path
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "See you later!"
    redirect_to sign_in_path
  end
end
