class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    if question.valid?
      question.save
      redirect_to questions_path
    else
      # TODO
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.delete
    redirect_to questions_path
  end

  private

    def question_params
      params.require(:question).permit(:content)
    end
end
