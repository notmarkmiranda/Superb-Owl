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
      redirect_to @pool
    end
  end

  private

  def pool_params
    params.require(:pool).permit(:user_id, :name, :active, :lock, :finalize, :multiple_entries)
  end
end
