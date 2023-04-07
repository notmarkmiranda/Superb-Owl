class PoolsController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def show
    @pool = Pool.includes(:admins, :members).find(params[:id])
    authorize @pool
  end

  def new
    @pool = current_user.pools.new
  end

  def create
    @pool = Pool.new(pool_params.merge(user_id: current_user.id))
    if @pool.save
      flash[:notice] = "Pool created!"
      redirect_to @pool
    else
      flash[:alert] = @pool.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def pool_params
    params.require(:pool).permit(:name, :game, :active, :locked, :finalized, :archived)
  end
end
