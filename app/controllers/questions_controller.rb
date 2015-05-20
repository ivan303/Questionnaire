class QuestionsController < ApplicationController

  layout "admin"
  before_filter :authenticate

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
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

  def update
    question = Question.find(params[:id])
    question.content = question_params[:content]
    if question.valid?
      question.save
      flash[:success] = 'Pytanie pomyślnie zmodyfikowane'
      redirect_to questions_path
    else
      flash[:error] = 'Pytania nie udało się zmodyfikować'
      redirect_to questions_path
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
