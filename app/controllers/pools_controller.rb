class PoolsController < ApplicationController
  before_action :require_user

  def show
    @pool = Pool.includes(questions: :options).find(params[:id])
    @questions = @pool.questions
    @question = @pool.questions.new
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

  def edit
    @pool = current_user.pools.find(params[:id])
  end

  def update
    @pool = current_user.pools.find(params[:id])
    if @pool.update(pool_params)
      redirect_to @pool
    end
  end

  private

  def pool_params
    params.require(:pool).permit(:user_id, :name, :active, :lock, :finalize, :multiple_entries)
  end
end
