class QuestionsController < ApplicationController
  before_action :require_user

  def create
    @pool = Pool.find(params[:pool_id])
    @question = @pool.questions.new(question_params)
    @question.errors.add(:number_of_options, "less than 2 options") if @question.options.size < 2
    if @question.errors.empty? && @question.save
      flash[:notice] = "Your question has been created"
    else
      flash[:alert] = @question.errors.full_messages.join(", ")
    end
    redirect_to @pool
  end

  private

  def question_params
    params.require(:question).permit(:description, :tiebreaker, options_attributes: [:description])
  end
end
