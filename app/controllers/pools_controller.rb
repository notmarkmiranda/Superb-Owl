class PoolsController < ApplicationController
  before_action :require_user

  def show
    @pool = Pool.find(params[:id])
  end

  def new
    @pool = current_user.pools.new
  end

  def create
    @pool = current_user.pools.new(pool_params)
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
