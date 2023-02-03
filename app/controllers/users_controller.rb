class UsersController < ApplicationController
  before_action :require_user

  def show
    redirect_to edit_user_path unless current_user.names_complete? || params[:skip] == "true"
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :nickname)
  end
end
