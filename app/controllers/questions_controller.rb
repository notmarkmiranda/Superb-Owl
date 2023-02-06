class QuestionsController < ApplicationController
  before_action :require_user

  def create
    @pool = Pool.find(params[:pool_id])
    @question = @pool.questions.new(question_params)
    @question.errors.add(:number_of_options, "less than 2 options") if @question.options.size < 2
    if @question.errors.empty? && @question.save
      redirect_to @pool
    else
      flash[:alert] = @question.errors.full_messages.join(", ")
      redirect_to @pool
    end
  end

  private

  def question_params
    params.require(:question).permit(:description, options_attributes: [:description])
  end
end
