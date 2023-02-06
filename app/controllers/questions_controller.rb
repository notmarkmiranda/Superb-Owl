class QuestionsController < ApplicationController
  before_action :require_user

  def create
    @pool = Pool.find(params[:pool_id])
    @question = @pool.questions.new(question_params)

    if @question.save
      redirect_to @pool
    end
  end

  private

  def question_params
    params.require(:question).permit(:description, options_attributes: [:description])
  end
end
